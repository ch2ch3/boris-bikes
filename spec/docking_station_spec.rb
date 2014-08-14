require 'bike_container_spec'
require 'docking_station'

describe DockingStation do

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new }

	it_behaves_like "a bike container"

	context "at initialisation" do

		it "can be initialised with bikes" do
			station = DockingStation.new(:bikes => [bike])
			expect(station.bikes).to eq [bike]
		end

		it "has a default capacity" do
			expect(station.capacity).to eq 10
		end

		it "allows setting capacity on initialising" do
			station = DockingStation.new(:capacity => 30)
			expect(station.capacity).to eq 30
		end

	end

	it "does not release a broken bike" do
		bike.break!
		station.dock(bike)
		station.release!
		expect(station.bikes).to eq [bike]
	end

end