module ApplicationHelper
  def temperature_icon_color temperature
    temperature = 100 if temperature.is_a?(String) || temperature.nil?
    if temperature > 12
      'red'
    elsif temperature >= 5 && temperature < 12
      'yellow'
    else
      'green'
    end
  end

  def barrel_state_color state
    state == 'full' ? 'green' : 'red'
  end

  def barrel_state_label state
    if state
      I18n.t("miscellaneous.#{state}").capitalize
    else
      '-'
    end
  end

  def store_type type
    type == 'brewery' ? 'Cervecería' : 'Bar'
  end

end
