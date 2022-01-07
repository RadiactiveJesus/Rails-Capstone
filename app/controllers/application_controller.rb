class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  #   helper_method simply makes the passed in arguments available as helper methods in the views.
  #   This means we can call both current_user and logged_in? from the views.
  # helper_method :current_user

  private

  def require_login
    redirect_to login_path unless logged_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username password])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[username password])
  end
end
