class FuelService

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_fuel_stations
    @conn ||= Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-API-Key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip_code}&fuel_type=ELEC,LPG")

    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
