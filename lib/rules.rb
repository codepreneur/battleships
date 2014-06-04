module Rules

	def range
		("A".."J").map{ |char| 1.upto(10).map{ |num| "#{char}#{num}" }  }.flatten
	end

	def previous(character)
		(character.ord - 1).chr
	end

	def generate_range(coord)

	end

	def surrounding_cells(coord)
		coord.chars
	end


end