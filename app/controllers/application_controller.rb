class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:message] = "Please log in"
    redirect_to new_user_session_path
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected 
  def configure_permitted_parameters
    #This allows the attributes to be accessible at sign up. I had to add email and password after adding token.
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :stripe_token, :email, :password, :coupon) }
  end
end
