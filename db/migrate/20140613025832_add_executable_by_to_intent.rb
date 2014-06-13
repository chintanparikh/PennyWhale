class AddExecutableByToIntent < ActiveRecord::Migration
  def change
    add_column :intents, :executable_by, :string, array: true, default: '{}'
  end
end
