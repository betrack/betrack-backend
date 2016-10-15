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

  def last_temperatures
    self.barrel_statuses
      .where('temperature is not null')
      .order('temperature_tstmp asc')
      .last(10)
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
