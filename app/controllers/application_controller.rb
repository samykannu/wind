class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user
private
def authenticate_user!
  if current_user.blank?
    redirect_to root_path
  end
end
end
