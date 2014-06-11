class UserMailer < ActionMailer::Base
  default from: "hello@pennywhale.com"

  def plan_ending_email user
    @user = user
    @subject = "Your Pennywhale Free Trial will end in 3 days"
    mail(to: @user.email, subject: @subject)
  end

end
