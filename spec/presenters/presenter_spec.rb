
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
  end
end
