class RegistrationsController < ApplicationController
  # skip_before_action :require_login, only: [:index]

  def index
    @registrations = Registration.all
  end

  def new
    @registration = Registration.new
  end

  def create
    @user = User.find(current_user.id)
    @registration = Registration.new(registration_params)
    if @registration.save
      flash[:success] = "You have successfully registered for the #{@registration.race.city} race"
      redirect_to registrations_path
    else
      flash[:danger] = "You have not been registered"
      render :new
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    if @registration.update(registration_params)
      flash[:success] = "You have successfully updated your registration for the #{@registration.race.city} race"
      redirect_to registrations_path
    else
      render :edit
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:user_id, :race_id, :boat_class_id)
  end

end
