require 'garage'

describe Garage do
	
	let(:bike) { Bike.new }
	let(:garage) { Garage.new(:capacity => 250) }

	it "should allow setting default capacity on initialising" do
		expect(garage.capacity).to eq 250
	end

	it "should fix broken bikes" do
		bike.break!
		expect(bike.work?).to eq false
		garage.dock(bike)
		expect(bike.work?).to eq true
	end
end