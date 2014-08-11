require 'bike'

describe Bike do
	
	let(:bike) {Bike.new}

	it 'should work' do
		expect(bike.work?).to eq true
	end

	it 'should not work if broken' do
		bike.break!
		expect(bike.work?).to eq false
	end

	it 'should work if fixed' do
		bike.break!
		bike.fix!
		expect(bike.work?).to eq true
	end

end