class BarrelStatus < ApplicationRecord
  belongs_to :barrel

  def owner_mac_address
    self.created_by_type.constantize.find(self.created_by_name).mac_address rescue nil
  end
end
