class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :intent_id
      t.integer :user_id
      t.integer :phrase_id
      t.string :actual_phrase

      t.timestamps
    end
  end
end
