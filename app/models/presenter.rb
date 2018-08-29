class Presenter
  def initialize(zip)
    @zip_code = zip
  end

  def closest_fuel_stations
    @conn ||= Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-API-Key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip_code}&fuel_type=ELEC,LPG")

    json = JSON.parse(response.body, symbolize_names: true)

    stations = json[:fuel_stations].map do |station_info|
      Station.new(station_info)
    end

    stations.sort_by {|station| station.distance }.shift(10)
  end
end
