require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(options = {})
		self.bikes = options.fetch(:bikes, bikes)
		self.capacity = options.fetch(:capacity, capacity)
	end

	alias_method :old_dock, :dock

	def dock(bike)
		# fixes the bike before docking it
		bike.fix!
		old_dock(bike)
	end

end