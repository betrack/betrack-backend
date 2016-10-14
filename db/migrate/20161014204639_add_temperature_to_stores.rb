class AddTemperatureToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :temperature, :float
  end
end
