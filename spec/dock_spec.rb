require 'bike'
require 'dock'

describe Dock do

	let(:dock) {Dock.new}
	let(:bike) {Bike.new}

	it 'should know if a bike is docked to it' do
		expect(dock.bikes).to eq []
	end

	it "should be able to dock a bike" do 
		dock.dock(bike)
		expect(dock.bikes).to eq [bike]
	end

	it "should be able to release a bike" do
		dock.dock(bike)
		dock.release!
		expect(dock.bikes).to eq []
	end

	it "should not release a broken bike" do
		bike.break!
		dock.dock(bike)
		dock.release!
		expect(dock.bikes).to eq [bike]
	end

	it "should know if it's full" do
		expect(@capacity).to eq bikes.length
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