require 'person'

describe Person do

	let(:person)       { Person.new }
	let(:bike)         { Bike.new }
	let(:another_bike) { Bike.new }
	let(:station)      { DockingStation.new(:bikes => [bike, another_bike]) }

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

		it 'cannot have more than one bike' do
			person.rent_bike_from(station)
			expect{ person.rent_bike_from(station) }.to raise_error
		end

		it 'receives the same bike that the docking station releases' do
			bike_id = station.available_bikes[-1].object_id
			person.rent_bike_from(station)
			expect(person.bike[0].object_id).to eq bike_id
		end

		it 'should not be able to rent a broken bike' do
			bike.break!
			another_bike.break!
			person.rent_bike_from(station)
			expect(person.has_bike?).to eq false
		end

		it 'can break a bike' do
			person.rent_bike_from(station)
			person.has_accident!
			expect(person.bike[0].work?).to eq false
		end
		
		it 'can return a bike' do
			person.rent_bike_from(station)
			person.return_bike_to(station)
			expect(person.has_bike?).to eq false
		end

		it "can't return a bike if it doesn't have one" do
			expect{ person.return_bike_to(station) }.to raise_error
		end

	end

end