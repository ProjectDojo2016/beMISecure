class StationFeedbacksController < ApplicationController
  before_action :set_station_feedback, only: [:show, :edit, :update, :destroy]

  # GET /station_feedbacks
  # GET /station_feedbacks.json
  def index
    @station_feedbacks = StationFeedback.all
  end

  # GET /station_feedbacks/1
  # GET /station_feedbacks/1.json
  def show
  end

  # GET /station_feedbacks/new
  def new
    @station_feedback = StationFeedback.new
  end

  # GET /station_feedbacks/1/edit
  def edit
  end

  # POST /station_feedbacks
  # POST /station_feedbacks.json
  def create
    @station_feedback = StationFeedback.new(station_feedback_params)

    #trovo il parcheggio corrispondente al feedback ... l'ultimo parcheggio su quella catena 
    parcheggio = @station_feedback.chain.parking_events.last
    
    if @station_feedback.azione == "open"     #cioè la catena si è aperta
      if parcheggio.getbikerequest.nil?       #cioè sto parcheggiando
        parcheggio.parkcompleted = Time.now
      else                                    #cioè sto ritirando la bici
        parcheggio.getbikeallowed = Time.now
      end  
    end

    if @station_feedback.azione == "close"    #cioè la catena si è chiusa
      if parcheggio.getbikerequest.nil?       #cioè sto parcheggiando
        parcheggio.parkcompleted = Time.now 
      else                                    #cioè sto ritirando la bici
        parcheggio.getbikecompleted = Time.now
      end  
    end

    parcheggio.save 

    respond_to do |format|
      if @station_feedback.save
        format.html { redirect_to @station_feedback, notice: 'Station feedback was successfully created.' }
        format.json { render :show, status: :created, location: @station_feedback }
      else
        format.html { render :new }
        format.json { render json: @station_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /station_feedbacks/1
  # PATCH/PUT /station_feedbacks/1.json
  def update
    respond_to do |format|
      if @station_feedback.update(station_feedback_params)
        format.html { redirect_to @station_feedback, notice: 'Station feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @station_feedback }
      else
        format.html { render :edit }
        format.json { render json: @station_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /station_feedbacks/1
  # DELETE /station_feedbacks/1.json
  def destroy
    @station_feedback.destroy
    respond_to do |format|
      format.html { redirect_to station_feedbacks_url, notice: 'Station feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station_feedback
      @station_feedback = StationFeedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_feedback_params
      params.require(:station_feedback).permit(:chain_id, :azione)
    end
end
