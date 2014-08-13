class Bike

	def initialize
		@working = true
		self
	end

	def work?
		@working
	end

	def break!
		@working = false
		self
	end

	def fix!
		@working = true
		self
	end

end
