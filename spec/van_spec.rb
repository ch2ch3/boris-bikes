require 'bike_container_spec'
require 'van'

describe Van do

	let(:bike)        { Bike.new             }
	let(:bike2)       { Bike.new             }
	let(:broken_bike) { Bike.new.break!      }
	let(:fixed_bike)  { Bike.new.break! }
	let(:van)         { Van.new              }
	let(:old_street)  { DockingStation.new   }
	let(:garage)      { Garage.new           }

	it_behaves_like "a bike container"

	context "at initialisation" do

		it "can be initialised with bikes" do
			van = Van.new(:bikes => [bike, bike2])
			expect(van.bike_count).to eq 2
		end

		it "has a default capacity" do
			expect(van.capacity).to eq 10
		end

		it "allows setting default capacity on initialising" do
			van = Van.new(:capacity => 20)
			expect(van.capacity).to eq 20
		end

	end

	context "picking up broken bikes" do

		it "picks up broken bikes from docking stations" do
			old_street.dock(broken_bike)
			expect(old_street.bikes).to eq [broken_bike]
			van.pick_up_broken_bikes_from(old_street)
			expect(van.bikes).to eq [broken_bike]
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

	end

end