class ChangeDefaultUserTypeToGuest < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, default: :guest
  end
end
