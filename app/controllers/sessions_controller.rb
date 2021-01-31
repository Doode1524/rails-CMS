class SessionsController < ApplicationController

  def new
    @user = User.find_by(params[:id])
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def login
  
  end

  def google
    @user = User.find_or_create_by(username: auth["info"]["name"], email: auth["info"]["email"]) do |user|
      user.password = SecureRandom.hex(10)
    end

    if @user && @user.id
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    log_out
    redirect_to '/login'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

end
