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

	it "should not release a broken bike" do
		bike.break!
		station.dock(bike)
		station.release!
		expect(station.bikes).to eq [bike]
	end

	it "should know if it's full" do
		expect(station.full?).to be false
		20.times { station.dock(Bike.new) }
		expect(station.full?).to be true
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