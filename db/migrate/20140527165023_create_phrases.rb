class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :phrase
    	t.integer :intent_id
      t.timestamps
    end
  end
end
