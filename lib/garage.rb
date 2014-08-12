require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	alias_method :old_dock, :dock

	def dock(bike)
		bike.fix!
		old_dock(bike)
	end

end