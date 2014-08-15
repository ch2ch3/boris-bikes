require 'person'

describe Person do

	let(:person) { Person.new }
	let(:bike) { Bike.new }
	let(:another_bike) { Bike.new }
	let(:station) { DockingStation.new(:bikes => [bike, another_bike]) }

	context 'at initialisation' do

		it 'will not have a bike' do
			expect(person.has_bike?).to eq false
		end

	end

	context 'renting and returning bikes' do

		it 'can have a bike' do
			person.rent_bike_from(station)
			expect(person.has_bike?).to eq true
		end

		it 'can not have more than one bike' do
			person.rent_bike_from(station)
			expect{ person.rent_bike_from(station) }.to raise_error
		end

		it 'can return a bike' do
			person.rent_bike_from(station)
			person.return_bike_to(station)
			expect(person.has_bike?).to eq false
		end

		it "can't return a bike if it doesn't have one" do
			expect{ person.return_bike_to(station) }.to raise_error
		end

		it 'can break a bike' do
			person.rent_bike_from(station)
			person.has_accident!
		end

		it 'should know what bike it has' do
			person.rent_bike_from(station)
			# expect(person.bike?).to return @bike
		end

		it 'receives the same bike that the docking station releases' do
			bike_id = station.available_bikes[-1].object_id
			person.rent_bike_from(station)
			expect(person.bike[0].object_id).to eq bike_id
		end

	end

end