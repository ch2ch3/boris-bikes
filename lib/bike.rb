class Bike

	def initialize
		@working = true
	end

	def work?
		@working
	end

	def break!
		@working = false
	end

	def fix!
		@working = true
	end

end
