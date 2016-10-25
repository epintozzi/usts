class RacesController < ApplicationController


  def index
    @races = Race.all
  end

  def show
    @race = Race.find(params[:id])
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.new(race_params)
    if @race.save
      redirect_to race_path(@race)
    else
      render :new
    end
  end

  private

  def race_params
    params.require(:race).permit(:address, :city, :state, :start_date, :end_date)
  end

end
