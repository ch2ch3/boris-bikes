require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.bikes = options.fetch(:bikes, bikes)
		self.capacity = options.fetch(:capacity, capacity)
	end

	def pick_up_broken_bikes_from(station)
		station.broken_bikes.each do |broken_bike|
			station.release(broken_bike)
			self.dock(broken_bike)
		end
	end

	def drop_off_broken_bikes_at(garage)
		self.broken_bikes.each do |broken_bike|
			self.release(broken_bike)
		end
	end

	def pick_up_fixed_bikes_from(garage)
		garage.available_bikes.each do |bike|
			garage.release(bike)
			self.dock(bike)
		end
	end

	def drop_off_fixed_bikes_at(station)
		self.available_bikes.each do |fixed_bike|
			self.release(fixed_bike)
			station.dock(fixed_bike)
		end
	end

end

