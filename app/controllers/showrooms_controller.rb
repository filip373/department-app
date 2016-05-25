class ShowroomsController < ApplicationController

  def index
    @showrooms = Showroom.all
  end

  def show
    @showroom = Showroom.find(params[:id])
  end

end
