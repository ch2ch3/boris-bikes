class Person

	def bike
		@bike
	end

	def initialize
		@bike = []
	end

	def has_bike?
		@bike.any?
	end

	def rent_bike_from(station)
		raise "You already have a bike!" if has_bike?
		@bike << station.available_bikes.pop
		station.bikes.delete(bike.first)
	end

	def return_bike_to(station)
		raise "You don't have a bike!" if !has_bike?
		station.bikes << bike.pop
	end

	def has_accident!
		bike[0].break!
		self
	end


end