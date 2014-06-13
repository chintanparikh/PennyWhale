class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception| 
    current_user ||= @current_user || User.new
    if current_user.is? :guest and cookies[:queries].to_i > 10
      flash[:notice] = "Your guest queries have run out - please log in or create a free account for unlimited queries"
      redirect_to new_user_session_path
    elsif @current_ability.cannot? :execute, exception.subject
      flash[:notice] = "Please upgrade to access that query"
      redirect_to root_path
    else
      flash[:error] = "Unauthorized"
      redirect_to new_user_session_path if current_user.guest?
      redirect_to root_path
    end
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

  private
  def current_ability
    @current_user = current_user
    @current_ability ||= Ability.new(current_user, cookies[:queries] || 0)
  end
end
