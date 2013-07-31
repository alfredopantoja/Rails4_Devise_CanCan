class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path(resource)  
  end  

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u| 
        u.permit(:name, :email, :password, :password_confirmation)
      end  
      devise_parameter_sanitizer.for(:account_update) do |u| 
        u.permit(:name, :email, :password, :password_confirmation, :current_password)
      end  
    end  
end
