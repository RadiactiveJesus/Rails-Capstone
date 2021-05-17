class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
  #   helper_method simply makes the passed in arguments available as helper methods in the views.
  #   This means we can call both current_user and logged_in? from the views.
    helper_method :current_user, :logged_in?
    
    protected

    

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    else
      @current_user = nil
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    current_user.nil? ? false : true
  end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    end
end
