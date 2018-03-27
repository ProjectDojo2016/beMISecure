class PhoneRequestsController < ApplicationController
  before_action :set_phone_request, only: [:show, :edit, :update, :destroy]

  # GET /phone_requests
  # GET /phone_requests.json
  def index
    @phone_requests = PhoneRequest.all
  end

  # GET /phone_requests/1
  # GET /phone_requests/1.json
  def show
  end

  # GET /phone_requests/new
  def new
    @phone_request = PhoneRequest.new
  end

  # GET /phone_requests/1/edit
  def edit
  end

  # POST /phone_requests
  # POST /phone_requests.json
  def create
    @phone_request = PhoneRequest.new(phone_request_params)
    
    parcheggioDaCreare  = true
    parcheggioDaAggiornare = false 
    
    if !@phone_request.user.isActive?
      parcheggioDaCreare  = false 
      @phone_request.response = "Paga prima di usare il servizio"
    end
    
    if !@phone_request.chain.isFree?
      parcheggioDaCreare  = false 
      parcheggioDaAggiornare = false  
       @phone_request.response = "Settimo .. non rubare le bici degli altri"
    end
    
    if @phone_request.user.hasBikeParkedIn? @phone_request.chain
      parcheggioDaCreare  = false 
      parcheggioDaAggiornare = true  
       @phone_request.response = "ricevuta richiesta di sblocco"
    end
    
    
    if parcheggioDaCreare
    
      parcheggio = ParkingEvent.new(:user => @phone_request.user, :chain => @phone_request.chain, :parkrequest => Time.now)
      if parcheggio.save
        @phone_request.response = "Creato il parcheggio: " + parcheggio.id.to_s + " sulla catena: " + @phone_request.chain.id.to_s
      else 
         @phone_request.response = "si è verificato un errore durante il parcheggio "
      end
    
    end
    
    if parcheggioDaAggiornare
    
      parcheggio = @phone_request.chain.parking_events.last
      parcheggio.getbikerequest = Time.now
      if parcheggio.save
        @phone_request.response = "Ricevuta richiesta di sblocco del parcheggio: " + parcheggio.id.to_s + " sulla catena: " + @phone_request.chain.id.to_s
      else 
        @phone_request.response = "si è verificato un errore durante lo sblocco "
      end
    
    end    
    
    
    
    respond_to do |format|
      if @phone_request.save
        format.html { redirect_to @phone_request, notice: 'Phone request was successfully created.' }
        format.json { render :show, status: :created, location: @phone_request }
      else
        format.html { render :new }
        format.json { render json: @phone_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_requests/1
  # PATCH/PUT /phone_requests/1.json
  def update
    respond_to do |format|
      if @phone_request.update(phone_request_params)
        format.html { redirect_to @phone_request, notice: 'Phone request was successfully updated.' }
        format.json { render :show, status: :ok, location: @phone_request }
      else
        format.html { render :edit }
        format.json { render json: @phone_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_requests/1
  # DELETE /phone_requests/1.json
  def destroy
    @phone_request.destroy
    respond_to do |format|
      format.html { redirect_to phone_requests_url, notice: 'Phone request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_request
      @phone_request = PhoneRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_request_params
      #params.fetch(:phone_request, {})
      params.require(:phone_request).permit(:user_id, :chain_id)

    end
end
