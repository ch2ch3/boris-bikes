require 'bike_container_spec'
require 'van'

describe Van do

	let(:bike)        { Bike.new           }
	let(:bike2)        { Bike.new           }
	let(:broken_bike) { Bike.new.break!    }
	let(:van)         { Van.new            }
	let(:old_street)  { DockingStation.new }
	let(:garage)      { Garage.new         }

	it_behaves_like "a bike container"

	context "at initialisation" do

		it "has a default capacity" do
			expect(van.capacity).to eq 10
		end

		it "allows setting default capacity on initialising" do
			van = Van.new(:capacity => 20)
			expect(van.capacity).to eq 20
		end

		it "can be initialised with bikes" do
			van = Van.new(:bikes => [bike, bike2])
			expect(van.bike_count).to eq 2
		end

	end

	context "picking up broken bikes" do

		it "picks up broken bikes from docking stations" do
			old_street.dock(broken_bike)
			expect(old_street.bikes).to eq [broken_bike]
			van.pick_up_broken_bikes_from(old_street)
			expect(van.bikes).to eq [broken_bike]
		end

	end

end