class Cell
	
	def initialize
		@status = :empty
	end

	def status
		@status
	end

	def status=(value)
		@status=value
	end

	# def attempt(coordinate,board,ship)
	# 	# ship.take_hit && hit! if board.representation[coordinate].status == :ship 
	# 	# missed! if board.representation[coordinate].status == :empty
	# end

	def ship!
		@status = :ship
		self
	end

	def hit!
		@status = :hit
		self
	end

	def missed!
		@status = :missed
		self
	end

	def shoot!
		damage_ship if ship_here?
		splash_water if water_here?
	end

	def ship_here?
		@status == :ship
	end

	def water_here?
		@status == :empty
	end

	def damage_ship
		hit!
	end

	def splash_water
		missed!
	end

end
