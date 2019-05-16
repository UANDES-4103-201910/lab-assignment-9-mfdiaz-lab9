class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_user_logged_in?
  helper_method :get_current_user

  def index

  end

  def get_current_user
    current_user
  end

  def is_user_logged_in?
	#complete this method
  	logged_in = user_signed_in?
  end

  def redirect_if_not_logged_in
        logged_in = is_user_logged_in?
	if logged_in then true else redirect_to root_path end
  end
end
