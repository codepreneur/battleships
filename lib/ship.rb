class Ship

	SHIP_TYPES = [:battleship, :cruiser, :destroyer, :submarine]

	def initialize(coord_array)
		@coord_array = coord_array
		@coord_letters ||= []
		@coord_numbers ||= []
		@size = set_size_according_to_coordinates(coord_array)
		@type = set_type_according_to_size(size)
		@status = :floating
		@hit_count = 0
		split
	end

	def coord_letters
		@coord_letters
	end

	def coord_numbers
		@coord_numbers
	end

	def convert_coords_to_cells(board)
		cells = [] 
		coordinates.map do |coordinate|
			cell_object = board.representation[coordinate]
			cells << cell_object
		end
		return cells
	end

	def type
		@type
	end

	def set_type_according_to_size(size)
		case(size)
			when (1) then @type = :submarine	
			when (2) then @type = :destroyer
			when (3) then @type = :cruiser
			when (4) then @type = :battleship
		end
	end

	def coordinates
		@coord_array
	end

	def set_size_according_to_coordinates(coord_array)
		if (coord_array.is_a? Array)
			coord_array.length
		else
		    raise ArgumentError.new("coordinates must be given in an array")	
		end
	end

	def size
		@size
	end

	def status
		@status
	end

	# def hit_count
	# 	@hit_count
	# end

	def floating?
		@status == :floating
	end

	def sunk?
		@status == :sunk
	end

	# def sink
	# 	if @hit_count == @size && !sunk?
	# 		@status = :sunk
	# 	elsif @hit_count == @size && sunk?
	# 		"ship already sunk"
	# 	else 
	# 		"ship shouldn\'t sink yet"
	# 	end
	# 	# @status == :floating ? @status = :sunk : "ship already sunk"
	# end
	def hit_count=(value)
		@hit_count = value
	end

	def hit_cells(board)
		@hit_count = convert_coords_to_cells(board).select { |cell|	cell.status == :hit	}.count
	end

	# def hit_count
	# 	@hit_count
	# end

	def take_hit
		# @hit_count = hit_cells(board)
		@hit_count == @size ? @status = :sunk : "" #{@type} has taken #{hit_count} #{message_modifier}"
		
		# @hit_count += 1 unless @hit_count == @size
		# # hit_count == 1 ? message_modifier = "hit" : message_modifier = "hits" 
		# @hit_count == size ? @status = :sunk : "#{@type} has taken #{hit_count} #{message_modifier}"
	end

	# Algorithm is down below

	def range
		("A".."J").map{ |char| 1.upto(10).map{ |num| "#{char}#{num}" }  }.flatten
	end

	def create_range(l1,l2,n1,n2)
		(l1..l2).map{ |char| (n1..n2).map{ |num| "#{char}#{num}" }  }.flatten
	end

	def previous(char)
		(char.ord - 1).chr
	end

	def horizontal?
		coord_letters.uniq.count == 1 && incremental?(coord_numbers)
	end

	def vertical?
		coord_numbers.uniq.count == 1 && incremental?(coord_letters)
	end

	def incremental?(array)
		(array[0]..array[-1]).to_a == array
	end

	def split
		coordinates.each{|coord| coord_letters << coord[0]; coord_numbers << coord[1].to_i }
	end


	# still needs finishing (WIP now) these are board functions

	# coordinates.each{|coord| coord[0] }

	# def surrounds(n)
	# 	l1 = previous(coord_letters[n])
	# 	l2 = coord_letters[n].next
	# 	n1 = (coord_numbers[n] - 2).next
	# 	n2 = coord_numbers[n].next
	# 	create_range(l1,l2,n1,n2)
	# end

	# def surround_cell(n)

	# end

	# def surrounds_ship(ship)
	# 	coordinates.each do |coord|
	# 		arr = []
	# 		arr << surrounds_cell(coord)
	# 	end
	# 		arr.uniq
	# end




		



end