class UsersController < ApplicationController
  before_action :find_user, only: [:edit,:show,:update]
  def new
    @user = User.new
  end
  def show
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
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
    @user = User.where("email =? and password = ?", params[:post][:email], params[:post][:password]).last
    if @user.present?
      redirect_to @user
    else
      render 'login'
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
