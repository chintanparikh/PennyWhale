class RemoveStripeTokenAndCouponFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :stripe_token
    remove_column :users, :coupon
  end
end
