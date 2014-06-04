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


	


end