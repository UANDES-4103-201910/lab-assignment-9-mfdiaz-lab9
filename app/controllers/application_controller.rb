class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_user_logged_in?
  helper_method :get_current_user

  def index

  end

  def current_user
    @current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

  def is_user_logged_in?
  	if current_user != nil then true else false end
  end

  def redirect_if_not_logged_in
        logged_in = is_user_logged_in?
	if logged_in then true else redirect_to root_path end
  end
end
