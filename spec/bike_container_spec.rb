require 'bike_container'

class ContainerHolder; include BikeContainer; end

shared_examples 'a bike container' do

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it "knows if a bike is docked to it" do
		expect(holder.bikes).to eq []
	end

	it "can accept a bike" do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	it "can release a bike" do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bikes).to eq []
	end

	def fill_container(container)
		container.capacity.times { container.dock(Bike.new) }
	end

	it "knows if it's full" do
		expect(holder.full?).to be false
		fill_container(holder)
		expect(holder.full?).to be true
	end

	it "does not accept a bike if it's full" do
		fill_container(holder)
		expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
	end

	it "provides the list of available bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq [working_bike]
	end

	it "provides the list of broken bikes" do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq [broken_bike]
	end

end