class RegistrationsController < Devise::RegistrationsController
  def upgrade
  	@user = current_user
    redirect_to new_user_session_path if @user.nil?  
  end

  def upgrade_user
  	@user = current_user
  	@user.update_stripe(params[:stripe_token], params[:coupon])
  	flash[:notice] = "You've been upgraded - try out the pro features, and feel free to contact us with any questions."
  	redirect_to app_root_path
  end
end
