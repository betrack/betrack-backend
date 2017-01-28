class Barrel < ApplicationRecord
  has_many :barrel_statuses
  belongs_to :store, :optional => true
  belongs_to :transport, :optional => true

  def last_state
    self.barrel_statuses
      .where('state is not null')
      .last
      .try(:state)
  end

  def last_temperature
    self.barrel_statuses
      .where('temperature is not null')
      .order('temperature_tstmp asc')
      .last
      .try(:temperature)
  end

  (1..98).each do |i|
    define_method("last_#{i}_temperatures") do
      self.barrel_statuses
        .where('temperature is not null')
        .order('temperature_tstmp asc')
        .last(i)
    end
  end

  def owner_type
    if self.transport
      'transport'
    elsif self.store
      'store'
    else
      '-'
    end
  end

  def battery_level
    self.barrel_statuses.where('battery_level is not null').last.try(:battery_level)
  end

end
