require 'bike'

describe Bike do
	
	let(:bike) {Bike.new}

	context "at initialisation" do

		it "works" do
			expect(bike.work?).to eq true
		end

	end

	context "in use" do

		it "does not work if broken" do
			bike.break!
			expect(bike.work?).to eq false
		end

		it "works if fixed" do
			bike.break!
			bike.fix!
			expect(bike.work?).to eq true
		end

	end

end