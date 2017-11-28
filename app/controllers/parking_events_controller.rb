class ParkingEventsController < ApplicationController
  before_action :set_parking_event, only: [:show, :edit, :update, :destroy]

  # GET /parking_events
  # GET /parking_events.json
  def index
    @parking_events = ParkingEvent.all
  end

  # GET /parking_events/1
  # GET /parking_events/1.json
  def show
  end

  # GET /parking_events/new
  def new
    @parking_event = ParkingEvent.new
  end

  # GET /parking_events/1/edit
  def edit
  end

  # POST /parking_events
  # POST /parking_events.json
  def create
    @parking_event = ParkingEvent.new(parking_event_params)

    respond_to do |format|
      if @parking_event.save
        format.html { redirect_to @parking_event, notice: 'Parking event was successfully created.' }
        format.json { render :show, status: :created, location: @parking_event }
      else
        format.html { render :new }
        format.json { render json: @parking_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_events/1
  # PATCH/PUT /parking_events/1.json
  def update
    respond_to do |format|
      if @parking_event.update(parking_event_params)
        format.html { redirect_to @parking_event, notice: 'Parking event was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking_event }
      else
        format.html { render :edit }
        format.json { render json: @parking_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_events/1
  # DELETE /parking_events/1.json
  def destroy
    @parking_event.destroy
    respond_to do |format|
      format.html { redirect_to parking_events_url, notice: 'Parking event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_event
      @parking_event = ParkingEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_event_params
      params.require(:parking_event).permit(:parkrequest, :parkallowed, :parkcompleted, :getbikerequest, :getbikecompleted)
    end
end
