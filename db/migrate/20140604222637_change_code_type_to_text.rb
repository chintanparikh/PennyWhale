class ChangeCodeTypeToText < ActiveRecord::Migration
  def change
  	remove_column :intents, :code
  	add_column :intents, :code, :text
  end
end
