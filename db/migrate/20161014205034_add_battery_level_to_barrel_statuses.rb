class AddBatteryLevelToBarrelStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :barrel_statuses, :battery_level, :float
  end
end
