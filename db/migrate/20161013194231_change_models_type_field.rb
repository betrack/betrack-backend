class ChangeModelsTypeField < ActiveRecord::Migration[5.0]
  def change
    rename_column :stores, :type, :store_type
    rename_column :barrels, :type, :barrel_type
  end
end
