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
    @registration = @user.registrations.create(registration_params)
    if @registration.save
      flash[:success] = "You have successfully registered for the #{@registration.race.city} race"
      redirect_to registrations_path
    else
      flash[:danger] = "You have not been registered"
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def registration_params
    params.require(:registration).permit(:user_id, :race_id, :boat_class_id)
  end

end
