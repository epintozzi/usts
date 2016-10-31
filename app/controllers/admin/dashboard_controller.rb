class Admin::DashboardController < Admin::BaseController

  def index
    @races = Race.all
    @users = User.all
    @boat_classes = BoatClass.all
    @registrations = Registration.all.group(:boat_class).count

  end
end
