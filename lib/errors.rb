class OverlappingShips < RuntimeError
	def initialize(message = "There is already a ship there")
		super
	end
end

class AdjacentShips < RuntimeError
	def initialize(message = "You can put a ship adjacent to another ship")
		super
	end
end