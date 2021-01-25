class SessionsController < ApplicationController

  def new
    @user = User.find_by(params[:id])
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to users_path(user)
    else
      render 'new'
    end

  end

  def login

  end

  def destroy
    log_out
    redirect_to '/login'
  end

end
