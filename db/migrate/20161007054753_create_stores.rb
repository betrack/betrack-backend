class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.float :lat, :scale => 10
      t.float :lon, :scale => 10
      t.string :name
      t.string :social_reason
      t.string :cuit
      t.string :email
      t.string :phone_number
      t.datetime :last_heartbeat
      t.string :type

      t.timestamps
    end
  end
end
