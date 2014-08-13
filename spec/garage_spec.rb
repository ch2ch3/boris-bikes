require 'garage'
require 'bike_container_spec'

describe Garage do
	
	let(:bike) { Bike.new }
	let(:garage) { Garage.new }

	it_behaves_like 'a bike container'

	context "at initialisation" do

		it "has a default capacity" do
			expect(garage.capacity).to eq 10
		end

		it "allows setting default capacity on initialising" do
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