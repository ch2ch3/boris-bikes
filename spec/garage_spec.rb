require 'garage'
require 'bike_container_spec'

describe Garage do
	
	let(:bike) { Bike.new }
	let(:garage) { Garage.new }

	it_behaves_like "a bike container"

	context "at initialisation" do

		it "can be initialised with bikes" do
			garage = Garage.new(:bikes => [bike])
			expect(garage.bikes).to eq [bike]
		end

		it "has a default capacity" do
			expect(garage.capacity).to eq 10
		end

		it "allows setting capacity on initialising" do
			garage = Garage.new(:capacity => 250)
			expect(garage.capacity).to eq 250
		end

	end

	it "fixes broken bikes" do
		bike.break!
		expect(bike.work?).to eq false
		garage.dock(bike)
		expect(bike.work?).to eq true
	end
end