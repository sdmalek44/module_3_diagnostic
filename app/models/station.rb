class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_times
              
  def initialize(station_info)
    @name = station_info[:station_name]
    @address = station_info[:street_address]
    @fuel_type = station_info[:fuel_type_code]
    @distance = station_info[:distance]
    @access_times = station_info[:access_days_time]
  end
end
