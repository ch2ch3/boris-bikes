require 'van'

describe Van do

	let(:bike) { Bike.new }
	let(:van) { Van.new(:capacity => 20) }

	it "should allow setting default capacity on initialising" do
		expect(van.capacity).to eq 20
	end

end