class CreateIntents < ActiveRecord::Migration
  def change
    create_table :intents do |t|
      t.string :code
      t.string :name
      t.timestamps
    end
  end
end
