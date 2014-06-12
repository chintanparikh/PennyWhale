class AddTickersToLog < ActiveRecord::Migration
  def change
    add_column :logs, :tickers, :string, array: true, default: '{}'
  end
end
