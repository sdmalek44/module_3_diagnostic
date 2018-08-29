require 'rails_helper'

describe FuelService do
  context 'instance methods' do
    it 'can get all fuel stations and keys' do
      service = FuelService.new("80203")

      expect(service.closest_fuel_stations.count).to eq(20)
      station = service.closest_fuel_stations.first
      expect(station).to have_key(:station_name)
      expect(station).to have_key(:street_address)
      expect(station).to have_key(:fuel_type_code)
      expect(station).to have_key(:distance)
      expect(station).to have_key(:access_days_time)
    end
  end
end
