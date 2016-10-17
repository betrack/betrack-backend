class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, :only => :update_owner

  def update_owner
    owner = Transport.find_by_mac_address(params[:mac_address]) || Store.find_by_mac_address(params[:mac_address])
    binding.pry
    if owner
      if owner.class.name == 'Transport'
        if owner.update(transport_params)
          render :json => { :message => "Transport updated successfully" }, :status => :ok
        else
          render :json => { :message => "Transport could not be updated", :errors => owner.errors }, :status => :unprocessable_entity
        end
      else
        if owner.update(store_params)
          render :json => { :message => "Store updated successfully" }, :status => :ok
        else
          render :json => { :message => "Store could not be updated", :errors => owner.errors }, :status => :unprocessable_entity
        end
      end
    else
      render :json => { :message => 'Owner not found' }, :status => :not_found
    end
  end

  def transport_params
    params.require(:owner).permit(:current_lat, :current_lon, :temperature, :temperature_date)
  end

  def store_params
    params.require(:owner).permit(:lat, :lon, :temperature, :last_heartbeat)
  end
end
