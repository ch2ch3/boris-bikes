require 'bike_container_spec'
require 'docking_station'

describe DockingStation do

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 30) }

	it_behaves_like 'a bike container'

	it "allows setting default capacity on initialising" do
		expect(station.capacity).to eq 30
	end

	it "does not release a broken bike" do
		bike.break!
		station.dock(bike)
		station.release!
		expect(station.bikes).to eq [bike]
	end

end