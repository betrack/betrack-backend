class BarrelsController < ApplicationController
  before_action :set_barrel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:update, :show, :update_status]
  skip_before_action :verify_authenticity_token, :only => :update_status

  #POST /barrels/update_status.json
  def update_status
    barrel = Barrel.find_by_mac_address(params[:barrel_mac_address])
    if barrel
      current_owner = barrel.transport || @barrel.store
      new_owner = Transport.find_by_mac_address(params[:owner_mac_address]) || Store.find_by_mac_address(params[:owner_mac_address])
      if current_owner != new_owner && !new_owner.nil?
        barrel.update_attributes("#{new_owner.class.name.downcase}_id".to_sym => new_owner.id)
      end
      @barrel.barrel_statuses.build(barrel_status_params)
      if barrel.save
        render :json => { :message => 'New status created successfully' }, :status => :created
      else
        render :json => { :message => 'New status could not be created' }, :status => :uprocessable_entity
      end
    else
      render :json => { :message => 'Barrel not found' }, :status => :not_found
    end
  end

  # GET /barrels
  # GET /barrels.json
  def index
    if params[:transport_id]
      @transport = Transport.find(params[:transport_id])
      @barrels = @transport.barrels
      render :all_for_transport
    elsif params[:store_id]
      @store = Store.find(params[:store_id])
      @barrels = @store.barrels
      render :all_for_store
    else
      @barrels = Barrel.all
      render :index
    end
  end

  # GET /barrels/1
  # GET /barrels/1.json
  def show
    @owner = @barrel.transport || @barrel.store
    @current_temperature = @barrel.last_temperature
    @data = {
      labels: @barrel.last_temperatures.map{ |k| k.created_at.strftime("%d/%m %H:%M")},
      datasets: [
        {
          label: "Temperatura",
          backgroundColor: "#80CBC4",
          borderColor: "#4DB6AC",
          data: @barrel.last_temperatures.map{ |k| { :y => k.temperature, :x => k.created_at } }
        }
      ]
    }
  end

  # GET /barrels/new
  def new
    @barrel = Barrel.new
  end

  # GET /barrels/1/edit
  def edit
  end

  # POST /barrels
  # POST /barrels.json
  def create
    @barrel = Barrel.new(barrel_params)

    respond_to do |format|
      if @barrel.save
        format.html { redirect_to @barrel, notice: 'Barrel was successfully created.' }
        format.json { render :show, status: :created, location: @barrel }
      else
        format.html { render :new }
        format.json { render json: @barrel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barrels/1
  # PATCH/PUT /barrels/1.json
  def update
    respond_to do |format|
      if @barrel.update(barrel_params)
        format.html { redirect_to @barrel, notice: 'Barrel was successfully updated.' }
        format.json { render :show, status: :ok, location: @barrel }
      else
        format.html { render :edit }
        format.json { render json: @barrel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barrels/1
  # DELETE /barrels/1.json
  def destroy
    @barrel.destroy
    respond_to do |format|
      format.html { redirect_to barrels_url, notice: 'Barrel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_barrel
    @barrel = Barrel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def barrel_params
    params.require(:barrel).permit(:barrel_type, :number, :content, :type_details, :rnpa, :description, :alcohol, :ibu, :ingredients, :elaboration_date, :expiration_date, :lot, :comments, :store_id, :transport_id)
  end

  def barrel_status_params
    params.require(:barrel_status).permit(:temperature, :temperature_tstmp, :state)
  end

end
