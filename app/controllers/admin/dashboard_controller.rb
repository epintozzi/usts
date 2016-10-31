class Admin::DashboardController < Admin::BaseController

  def index
    @races = Race.all
    @users = User.all
    @registrations = Registration.all.group(:boat_class).count
    
  end
end
