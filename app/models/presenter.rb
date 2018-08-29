class Presenter
  def initialize(zip)
    @zip_code = zip
  end

  def closest_fuel_stations
    @conn =|| Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers["X-API-Key"] = ENV["API_KEY"]
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/v1/nearest.json?location=#{@zip}&fuel_type=ELEC,LPG")
    JSON.parse(conn.get('').body, symbolize_names: true)
  end
end
