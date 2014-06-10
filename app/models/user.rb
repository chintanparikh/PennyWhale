class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :stripe_token, :coupon

  before_save :update_stripe
  before_destroy :cancel_subscription

  def is? requested_role
    self.role.to_sym == requested_role
  end

  def update_stripe
    return if email.include? '@pennywhale.com'
    begin
    if customer_id.nil?
      raise "Stripe token not present. Can't create account" unless stripe_token.present?

      if coupon.blank?
        customer = Stripe::Customer.create(
                  :email => email,
                  :card => stripe_token,
                  :plan => 'super'
                )
      else
        customer = Stripe::Customer.create(
                  :email => email,
                  :card => stripe_token,
                  :plan => 'super',
                  :coupon => coupon
                )
      end
    else
      customer = Stripe::Customer.retrieve(customer_id)
      customer.card = stripe_token if stripe_token.present?
      customer.email = email
      customer.save
    end

    self.customer_id = customer.id
    self.stripe_token = nil
    self.role = customer.subscriptions["data"][0]["plan"]["id"].to_sym

    rescue Stripe::StripeError => e
      logger.error "Stripe Error: " + e.message
      errors.add :base, "#{e.message}."
      self.stripe_token = nil
      false
    end
  end

  def cancel_subscription
    begin
    unless customer_id.nil?
      customer = Stripe::Customer.retrieve(customer_id)
      unless customer.nil? or customer.respond_to?('deleted')
        customer.cancel_subscription  
      end
    end
    rescue Stripe::StripeError => e
      logger.error "Stripe Error: " + e.message
      errors.add :base, "Unable to cancel your subscription. #{e.message}."
      false
    end
  end


end
