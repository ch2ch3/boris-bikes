require 'bike_container'

class ContainerHolder; include BikeContainer; end

shared_examples "a bike container" do

	let(:bike)           { Bike.new            }
	let(:working_bike)   { Bike.new            }
	let(:broken_bike)    { Bike.new.break!     }
	let(:holder)         { ContainerHolder.new }
	
	def fill_container(container)
		container.capacity.times { container.dock(Bike.new) }
	end

	context "basic operations" do

		it "knows if a bike is docked to it" do
			expect(holder.bikes).to eq []
		end

		it "knows if it's full" do
			expect(holder.full?).to be false
			fill_container(holder)
			expect(holder.full?).to be true
		end

		it "provides the list of available bikes" do
			holder.dock(working_bike)
			holder.dock(broken_bike)
			expect(holder.available_bikes).to eq [working_bike]
		end

		it "provides the list of broken bikes" do
			holder.dock(working_bike)
			holder.dock(broken_bike)
			expect(holder.broken_bikes).to eq [broken_bike]
		end

	end

	context "docking bikes" do

		it "can accept a bike" do
			expect(holder.bike_count).to eq 0
			holder.dock(bike)
			expect(holder.bike_count).to eq 1
		end

		it "does not accept a bike if it's full" do
			fill_container(holder)
			expect(lambda { holder.dock(bike) }).to raise_error
		end

		it "only docks bikes" do
			expect{ holder.dock(double :person) }.to raise_error
		end

		it "only docks bikes that haven't been docked yet" do
			holder.dock(bike)
			expect{ holder.dock(bike) }.to raise_error
		end

		it "fails if an empty argument is passed with dock" do
			expect{ holder.dock() }.to raise_error
		end

	end

	context "releasing bikes" do
		
		it "can release a bike" do
			holder.dock(bike)
			# bad test below: does not test for releasing bikes
			# expect(holder.bikes).to eq []
			expect(holder.release(bike)).to eq bike
		end		

		it "only releases bikes" do
			expect{ holder.release(double :person) }.to raise_error
		end

		it "does not release a bike that's not there" do
			expect{ holder.release(bike) }.to raise_error
		end

		it "fails if an empty argument is passed with release" do
			expect{ holder.release() }.to raise_error
		end

	end

end