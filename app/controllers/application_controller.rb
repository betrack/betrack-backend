class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, :only => :update_owner

  def update_owner
    owner = Transport.find_by_mac_address(params[:mac_address]) || Store.find_by_mac_address(params[:mac_address])
    if owner
      if owner.class.name == 'Transport'
        owner.temperature = owner_params[:temperature]
        owner.current_lon = owner_params[:current_lon]
        owner.current_lat = owner_params[:current_lat]
        owner.temperature_date = owner_params[:temperature_date]
        if owner.save
          render :json => { :message => "Transport updated successfully" }, :status => :ok
        else
          render :json => { :message => "Transport could not be updated", :errors => owner.errors }, :status => :unprocessable_entity
        end
      else
        owner.temperature = owner_params[:temperature]
        owner.last_heartbeat = owner_params[:temperature_date]
        if owner.save
          render :json => { :message => "Store updated successfully" }, :status => :ok
        else
          render :json => { :message => "Store could not be updated", :errors => owner.errors }, :status => :unprocessable_entity
        end
      end
    else
      render :json => { :message => 'Owner not found' }, :status => :not_found
    end
  end

  def owner_params
    params.require(:owner).permit(:lat, :lon, :temperature, :temperature_date)
  end
end
