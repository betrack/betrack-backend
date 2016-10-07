class CreateBarrelStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :barrel_statuses do |t|
      t.float :temperature
      t.datetime :temperature_tstmp
      t.string :state

      t.integer :barrel_id
      t.timestamps
    end
  end
end
