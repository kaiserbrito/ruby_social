class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_paramets
    devise_parameters_sanitizer.for(:sign_up) << [:name, :password_confirmation]
    devise_parameters_sanitizer.for(:sign_in) << [:email, :remember_me]
  end
end
