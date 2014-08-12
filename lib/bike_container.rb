module BikeContainer

	attr_writer :capacity

	DEFAULT_CAPACITY = 10

	def bikes
		@bikes ||= []
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
		raise "Station is full" if full?
		bikes << bike
	end

	def release!
		bikes.delete(available_bikes.first)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.select { |bike| bike.work? }
	end

end