module BikeContainer

	attr_writer :capacity

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
	end

	def bikes=(value)
		@bikes = value
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def dock(bike)
		raise "No more spaces!" if full?
		raise "That's not a bike!" if bike.class != Bike
		raise "That bike is already docked!" if bikes.include?(bike)
		bikes << bike
	end

	def release(bike)
		raise "Release failed." if !bikes.include?(bike)
		bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.select { |bike| bike.work? }
	end

	def broken_bikes
		bikes.select { |bike| !bike.work? }
	end

end