require 'bike'

class DockingStation
	DEFAULT_CAPACITY = 10

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@bikes = []
	end

	def bikes
		@bikes
	end

	def dock(bike)
		raise "Station is full" if full?
		@bikes << bike
	end

	def release!
		@bikes.delete(available_bikes.first)
	end

	def available_bikes
		@bikes.select{|bike|bike.work?}
	end

	def full?
		@bikes.count == @capacity
	end


	# def has_bike?
	# 	@has_bike
	# end

	# def remove_bike!
	# 	@has_bike = false
	# end

	# def receive_bike!
	# 	@has_bike = true
	# end

	# def release_bike?
	# 	if @has_bike && 
	# 		true
	# 	end
	# end

end