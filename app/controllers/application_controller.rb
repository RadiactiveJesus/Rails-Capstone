class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
  #   helper_method simply makes the passed in arguments available as helper methods in the views.
  #   This means we can call both current_user and logged_in? from the views.
    # helper_method :current_user
    
    private

     

  def require_login
      if !logged_in?
        redirect_to login_path
      end
  end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
    end
end
