require 'docking_station'

describe DockingStation do

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new(:capacity => 30) }

	# it "should provide the list of available bikes" do
	# 	working_bike, broken_bike = Bike.new, Bike.new
	# 	broken_bike.break!
	# 	station.dock(working_bike)
	# 	station.dock(broken_bike)
	# 	expect(station.available_bikes).to eq [working_bike]
	# end

	it "should allow setting default capacity on initialising" do
		expect(station.capacity).to eq 30
	end

	it "should not release a broken bike" do
		bike.break!
		station.dock(bike)
		station.release!
		expect(station.bikes).to eq [bike]
	end

end