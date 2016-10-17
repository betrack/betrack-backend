class AddMacAddressToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :mac_address, :string
    add_column :transports, :mac_address, :string
    add_column :barrels, :mac_address, :string
  end
end
