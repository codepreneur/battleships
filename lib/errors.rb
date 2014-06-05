class OverlappingShips < RuntimeError
	def initialize(message = "There is already a ship there")
		super
	end
end