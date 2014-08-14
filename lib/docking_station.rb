require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		self.bikes = options.fetch(:bikes, bikes)
		self.capacity = options.fetch(:capacity, capacity)	
	end

	def release!
	 	bikes.delete(available_bikes.first)
	end

end