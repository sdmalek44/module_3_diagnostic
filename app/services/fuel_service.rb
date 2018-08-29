class FuelService

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def closest_fuel_stations
    get_json("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip_code}&fuel_type=ELEC,LPG")[:fuel_stations]
  end

  private

  def conn
    @conn ||= Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-API-Key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
