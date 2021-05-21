# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
     if is_navigational_format?
        set_flash_message(:notice, :signed_in)
     end
     sign_in(resource_name, resource)
     redirect_to root_path
  end

  # DELETE /resource/sign_out
  def destroy
    reset_session
    redirect_to root_path, notice: 'Logged out'
  end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :password])
  end
end
