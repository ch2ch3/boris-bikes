require_relative 'bike_container'

class DockingStation

	attr_writer :location

	include BikeContainer

	def initialize(options = {})
		self.bikes = options.fetch(:bikes, bikes)
		self.capacity = options.fetch(:capacity, capacity)
		self.location = options.fetch(:location, location)
	end

	def location
		@location ||= :old_street
	end

	def empty?
		!bikes.any?
	end

end