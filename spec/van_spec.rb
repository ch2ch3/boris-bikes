require 'bike_container_spec'
require 'van'

describe Van do

	let(:bike)        { Bike.new             }
	let(:broken_bike) { Bike.new.break!      }
	let(:fixed_bike)  { Bike.new.break!      }
	let(:van)         { Van.new              }
	let(:station)     { DockingStation.new   }
	let(:garage)      { Garage.new           }

	it_behaves_like "a bike container"

	context "at initialisation" do

		it "can be initialised with bikes" do
			van = Van.new(:bikes => [bike, broken_bike])
			expect(van.bike_count).to eq 2
		end

		it "has a default capacity" do
			expect(van.capacity).to eq 10
		end

		it "allows setting capacity on initialising" do
			van = Van.new(:capacity => 20)
			expect(van.capacity).to eq 20
		end

	end

	context "picking up broken bikes" do

		it "picks up broken bikes from docking stations" do
			station.dock(broken_bike)
			expect(station.bikes).to eq [broken_bike]
			van.pick_up_broken_bikes_from(station)
			expect(van.bikes).to eq [broken_bike]
		end

		it "does not pick up working bikes from docking stations" do
			station = DockingStation.new(:bikes => [bike, broken_bike])
			expect(station.bike_count).to eq 2
			van.pick_up_broken_bikes_from(station)
			expect(station.bikes).to eq [bike]
		end

		it "drops off broken bikes at garage" do
			van = Van.new(:bikes => [broken_bike])
			van.drop_off_broken_bikes_at(garage)
			expect(van.bikes).to eq []
		end

	end

	context "dropping off fixed bikes" do

		it "picks up fixed bikes from garage" do
			garage.dock(fixed_bike)
			van.pick_up_fixed_bikes_from(garage)
			expect(van.bikes).to eq [fixed_bike]
		end

		it "does not pick up broken bikes from garage" do
			garage = Garage.new(:bikes => [broken_bike, fixed_bike.fix!])
			van.pick_up_fixed_bikes_from(garage)
			expect(van.bikes).to eq [fixed_bike]
		end

		it "drops off fixed bikes at docking stations" do
			garage.dock(fixed_bike)
			van = Van.new(:bikes => [fixed_bike])
			van.drop_off_fixed_bikes_at(station)
			expect(van.bikes).to eq []
			expect(station.bikes).to eq [fixed_bike]
		end

	end

end