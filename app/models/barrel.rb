class Barrel < ApplicationRecord
  has_many :barrel_statuses
  belongs_to :store, :optional => true
  belongs_to :transport, :optional => true
end
