class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  set_current_tenant_through_filter
  before_filter :set_tenant
  include ApplicationHelper

  def set_tenant
    if user_signed_in?
      current_institution = current_user.institution
      set_current_tenant(current_institution)
    end
  end


  protected
  	  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :handle, :avatar, :password, :password_confirmation) }
end
end
