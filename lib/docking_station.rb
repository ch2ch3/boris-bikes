require_relative 'bike_container'

class DockingStation

	include BikeContainer

	def initialize(options = {})
		self.bikes = options.fetch(:bikes, bikes)
		self.capacity = options.fetch(:capacity, capacity)	
	end

end