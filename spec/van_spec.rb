require 'bike_container_spec'
require 'van'

describe Van do

	let(:bike) { Bike.new }
	let(:van) { Van.new }

	it_behaves_like 'a bike container'

	context "at initialisation" do

		it "has a default capacity" do
			expect(van.capacity).to eq 10
		end

		it "allows setting default capacity on initialising" do
			van = Van.new(:capacity => 20)
			expect(van.capacity).to eq 20
		end

	end


end