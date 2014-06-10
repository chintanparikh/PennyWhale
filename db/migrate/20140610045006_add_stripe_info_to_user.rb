class AddStripeInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :stripe_token, :string
    add_column :users, :coupon, :string
    add_column :users, :customer_id, :integer
    add_column :users, :last_4_digits, :integer
  end
end
