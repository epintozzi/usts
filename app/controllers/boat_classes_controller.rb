class BoatClassesController < ApplicationController

  def index
    @boat_classes = BoatClass.all
  end

  def new
    @boat_class = BoatClass.new
  end

  def create
    @boat_class = BoatClass.new(boat_class_params)
    if @boat_class.save
      flash[:success] = "#{@boat_class.class_name} was successfully created!"
      redirect_to boat_classes_path
    else
      render :new
    end
  end

  def edit
    @boat_class = BoatClass.find(params[:id])
  end

  def update
    @boat_class = BoatClass.find(params[:id])
    if @boat_class.update(boat_class_params)
      flash.now[:success] = "#{@boat_class.class_name} was successfully updated!"
    else
      render :new
    end
  end

  private

  def boat_class_params
    params.require(:boat_class).permit(:class_name)
  end

end
