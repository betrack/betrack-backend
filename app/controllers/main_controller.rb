class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    @transports = Transport.all
    @stores = Store.all
  end

  def active_markers
    @transports = Transport.all
    @stores = Store.all
    respond_to do |format|
      format.json { render :json => { :transports => @transports, :stores => @stores } }
    end
  end

end
