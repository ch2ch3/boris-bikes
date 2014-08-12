require 'bike'
require 'docking_station'

describe DockingStation do

	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}

	it 'should know if a bike is docked to it' do
		expect(station.bikes).to eq []
	end

	it "should be able to dock a bike" do 
		station.dock(bike)
		expect(station.bikes).to eq [bike]
	end

	it "should be able to release a bike" do
		station.dock(bike)
		station.release!
		expect(station.bikes).to eq []
	end

	def fill_station(station)
		20.times { station.dock(Bike.new) }
	end

	it "should know if it's full" do
		expect(station.full?).to be false
		fill_station(station)
		expect(station.full?).to be true
	end

	it "should not accept a bike if it's full" do
		fill_station(station)
		expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
	end

	it "should provide the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		station.dock(working_bike)
		station.dock(broken_bike)
		expect(station.available_bikes).to eq [working_bike]
	end

	it "should not release a broken bike" do
		bike.break!
		station.dock(bike)
		station.release!
		expect(station.bikes).to eq [bike]
	end

	# it 'should know if a bike has been released' do
	# 	dock.remove_bike!
	# 	expect(dock.has_bike?).to eq false
	# end

	# it 'should release a working bike to a person' do
	# 	dock.has_bike? && bike.work?
	# 	expect(dock.release_bike?).to be true
	# end

	# it 'should not release a broken bike to a person' do
	# 	dock.has_bike? && bike.break!
	# 	expect(dock.release_bike?).to be false
	# end

	# it 'should be able to receive a bike' do
	# 	dock.remove_bike!
	# 	dock.receive_bike!
	# 	expect(dock.has_bike?).to eq true
	# end

end