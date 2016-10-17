class AddCreatedByToBarrelStatuses < ActiveRecord::Migration[5.0]
  def change
    add_column :barrel_statuses, :created_by_name, :integer
    add_column :barrel_statuses, :created_by_type, :string
  end
end
