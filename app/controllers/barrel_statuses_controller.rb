class BarrelStatusesController < ApplicationController
  before_action :set_barrel_status, only: [:show, :edit, :update, :destroy]

  # GET /barrel_statuses
  # GET /barrel_statuses.json
  def index
    @barrel_statuses = BarrelStatus.all
  end

  # GET /barrel_statuses/1
  # GET /barrel_statuses/1.json
  def show
  end

  # GET /barrel_statuses/new
  def new
    @barrel_status = BarrelStatus.new
  end

  # GET /barrel_statuses/1/edit
  def edit
  end

  # POST /barrel_statuses
  # POST /barrel_statuses.json
  def create
    @barrel_status = BarrelStatus.new(barrel_status_params)

    respond_to do |format|
      if @barrel_status.save
        format.html { redirect_to @barrel_status, notice: 'Barrel status was successfully created.' }
        format.json { render :show, status: :created, location: @barrel_status }
      else
        format.html { render :new }
        format.json { render json: @barrel_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barrel_statuses/1
  # PATCH/PUT /barrel_statuses/1.json
  def update
    respond_to do |format|
      if @barrel_status.update(barrel_status_params)
        format.html { redirect_to @barrel_status, notice: 'Barrel status was successfully updated.' }
        format.json { render :show, status: :ok, location: @barrel_status }
      else
        format.html { render :edit }
        format.json { render json: @barrel_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barrel_statuses/1
  # DELETE /barrel_statuses/1.json
  def destroy
    @barrel_status.destroy
    respond_to do |format|
      format.html { redirect_to barrel_statuses_url, notice: 'Barrel status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barrel_status
      @barrel_status = BarrelStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barrel_status_params
      params.require(:barrel_status).permit(:temperature, :temperature_tstmp, :state)
    end
end
