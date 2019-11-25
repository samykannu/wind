class UsersController < ApplicationController
  before_action :find_user, only: [:edit,:show,:update]
  skip_before_action :authenticate_user!, only: [:login,:new,:create,:update,:login_create]
  def new
    @user = User.new
  end
  def show
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies[:logged_in] = {:value => true,:expires => 1.year.from_now}
      cookies[:user_name] = {:value => @user.name,:expires => 1.year.from_now}
      UserMailer.welcome_email(@user).deliver
      redirect_to '/articles', notice:"logged in"
    else
      p @user.errors
      render 'new'
    end
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render "edit"
    end
  end

  def login
  end
  def login_create
    user = User.where("email =? and password = ?", params[:post][:email], params[:post][:password]).last
    if user.present?
      session[:user_id] = user.id
      cookies[:logged_in] = {:value => true,:expires => 1.year.from_now}
      cookies[:user_name] = {:value => user.name,:expires => 1.year.from_now}
      redirect_to '/articles', notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "login"
    end
  end
  def logout
    session[:user_id] = nil
    cookies.delete :user_name
    cookies.delete :logged_in
    redirect_to root_url, notice: "Logged out!!!"
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
