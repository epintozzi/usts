class Admin::RacesController < Admin::BaseController

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

  def edit
    @race = Race.find(params[:id])
  end

  def update
    @race = Race.find(params[:id])
    if @race.update(race_params)
      flash[:success] = "You have successfully updates this race."
      redirect_to race_path(@race)
    else
      render :edit
    end
  end

  private

  def race_params
    params.require(:race).permit(:address, :city, :state, :start_date, :end_date)
  end
end
