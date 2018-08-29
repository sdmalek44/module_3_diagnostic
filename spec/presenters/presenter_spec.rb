
require 'rails_helper'

describe Presenter, type: :model do
  context 'instance methods' do
    it 'can get all fuel stations and keys' do
      presenter = Presenter.new("80203")

      expect(presenter.closest_fuel_stations.count).to eq(10)
      station = presenter.closest_fuel_stations.first

      expect(station.name).to eq('UDR')
      expect(station.address).to eq('800 Acoma St')
      expect(station.fuel_type).to eq('ELEC')
      expect(station.distance).to eq(0.31422)
      expect(station.access_times).to eq("24 hours daily")
    end
    it 'can order by distance' do

      all_stations = FuelService.new("80203").closest_fuel_stations.map {|station_info| Station.new(station_info)}
      presenter = Presenter.new("80203")
      expected = presenter.sort_by_distance(all_stations)

      expect(all_stations.count).to eq(20)
      expect(expected.count).to eq(10)
      
      expect(expected.first.distance).to eq(0.31422)
      expect(expected.last.distance).to eq(0.76279)
    end
  end
end
