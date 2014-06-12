class RenameActualPhraseToQuery < ActiveRecord::Migration
  def change
    remove_column :logs, :actual_phrase
    add_column :logs, :query, :string
  end
end
