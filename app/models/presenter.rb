class Presenter
  def initialize(zip)
    @service = FuelService.new(zip)
  end

  def closest_fuel_stations
    stations = @service.closest_fuel_stations.map do |station_info|
      Station.new(station_info)
    end
    sort_by_distance(stations)
  end

  def sort_by_distance(stations)
    stations.sort_by {|station| station.distance }.shift(10)
  end

end
