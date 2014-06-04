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


	def attempt(coordinate,board)
		hit! if board.representation[coordinate].status == :ship 
		missed! if board.representation[coordinate].status == :empty
	end

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

	def build(ship, board)
		# ship.coordinates expected to return an array ["A1", "A2", "A3"]
		ship.coordinates.map do |coord|
			board.representation[coord].status = :ship
		end
	end
end
