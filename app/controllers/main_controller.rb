class MainController < ApplicationController

  def index
  end

  def active_transports
    @transports = Transport.all
    respond_to do |format|
      format.json { render :json => { :transports => @transports } }
    end
  end

end
