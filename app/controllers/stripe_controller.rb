class StripeController < ApplicationController
  protect_from_forgery :except => :webhook 

  def webhook
    case params[:type]
      when "customer.subscription.trial_will_end"
        user = User.find_by_customer_id(params[:data][:object][:customer])
        UserMailer.plan_ending_email(user).deliver
        render :nothing => true, :status => 200, :content_type => 'text/html'
      else
    end
  end
end
