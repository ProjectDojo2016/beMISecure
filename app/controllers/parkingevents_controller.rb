class ParkingeventsController < ApplicationController
  before_action :set_parkingevent, only: [:show, :edit, :update, :destroy]

  # GET /parkingevents
  # GET /parkingevents.json
  def index
    @parkingevents = Parkingevent.all
  end

  # GET /parkingevents/1
  # GET /parkingevents/1.json
  def show
  end

  # GET /parkingevents/new
  def new
    @parkingevent = Parkingevent.new
  end

  # GET /parkingevents/1/edit
  def edit
  end

  # POST /parkingevents
  # POST /parkingevents.json
  def create
    @parkingevent = Parkingevent.new(parkingevent_params)

    respond_to do |format|
      if @parkingevent.save
        format.html { redirect_to @parkingevent, notice: 'Parkingevent was successfully created.' }
        format.json { render :show, status: :created, location: @parkingevent }
      else
        format.html { render :new }
        format.json { render json: @parkingevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parkingevents/1
  # PATCH/PUT /parkingevents/1.json
  def update
    respond_to do |format|
      if @parkingevent.update(parkingevent_params)
        format.html { redirect_to @parkingevent, notice: 'Parkingevent was successfully updated.' }
        format.json { render :show, status: :ok, location: @parkingevent }
      else
        format.html { render :edit }
        format.json { render json: @parkingevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkingevents/1
  # DELETE /parkingevents/1.json
  def destroy
    @parkingevent.destroy
    respond_to do |format|
      format.html { redirect_to parkingevents_url, notice: 'Parkingevent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parkingevent
      @parkingevent = Parkingevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parkingevent_params
      params.require(:parkingevent).permit(:parkrequest, :datetime, :parkallowed, :d)
    end
end
