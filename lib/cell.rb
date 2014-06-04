class Cell
	
	def initialize
		@status = :empty
	end

	def status
		@status
	end

	def attack(coordinate,board)
		if board.representation[coordinate].status == :ship 
			hit!
		end
		if board.representation[coordinate].status == :empty
			missed!
		end
	end

	def build(coordinate,board)
		
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

end
