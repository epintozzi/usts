class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "You have successfully logged in!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:danger] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "You have successfully logged out!"
    redirect_to login_path
  end


end
