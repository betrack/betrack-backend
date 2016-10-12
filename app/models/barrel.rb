class Barrel < ApplicationRecord
  has_many :barrel_statuses
  belongs_to :store, :optional => true
  belongs_to :transport, :optional => true

  def last_temperature
    self.barrel_statuses.last.try(:temperature) || '-'
  end
end
