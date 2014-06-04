class Board

	def initialize
		@representation = create_empty_grid
	end

	def representation
		@representation
	end


	def create_empty_grid
		grid = {}
		("A".."J").to_a.each {|letter| (1..10).to_a.each {|number| grid["#{letter}#{number}"] = Cell.new}}
		grid
	end


	def build(ship, board)
		# ship.coordinates expected to return an array ["A1", "A2", "A3"]
		ship.coordinates.map do |coord|
			board.representation[coord].status = :ship
		end
	end


end