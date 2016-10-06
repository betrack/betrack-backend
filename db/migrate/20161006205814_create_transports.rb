class CreateTransports < ActiveRecord::Migration[5.0]
  def change
    create_table :transports do |t|
      t.integer :number
      t.float :current_lat, :scale => 10
      t.float :current_lon, :scale => 10
      t.integer :temperature
      t.datetime :temperature_date
      t.string :identification
      t.string :phone_number
      t.string :driver

      t.timestamps
    end
  end
end
