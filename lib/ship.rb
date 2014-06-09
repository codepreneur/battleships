class Ship

	SHIP_TYPES = [:battleship, :cruiser, :destroyer, :submarine]

	def initialize(coord_array,board)
		@coord_array = coord_array
		@coord_letters ||= []
		@coord_numbers ||= []
		@surrounding_coordinates ||= []
		@size = set_size_according_to_coordinates(coord_array)
		@type = set_type_according_to_size(size)
		@status = :floating
		@hit_count = 0
		split
		raise "This ship is too big!!" if size > 4
		raise "There is already a ship there" if taken?(board)
		raise "Only straight (no diagonal or bent) ships please" unless horizontal? || vertical?
	end

	def coord_letters
		@coord_letters
	end

	def coord_numbers
		@coord_numbers
	end

	def surrounding_coordinates
		@surrounding_coordinates
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

	def floating?
		@status == :floating
	end

	def sunk?
		@status == :sunk
	end

	def hit_count=(value)
		@hit_count = value
	end

	def hit_cells(board)
		@hit_count = convert_coords_to_cells(board).select { |cell|	cell.status == :hit	}.count
	end

	def take_hit
		@hit_count == @size ? @status = :sunk : ""
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


	def surrounds(coord)
		create_range(previous(coord[0]),coord[0].next,(coord[1].to_i-2).next,coord[1].next.to_i)
	end


	def surrounds_ship
		coordinates.each do |coord|
			surrounding_coordinates << surrounds(coord)
		end
			surrounding_coordinates.uniq
	end

	def taken?(board)
		candidates.any? {|coord| board.representation[coord].status == :ship}
	end

	def candidates
		surrounds_ship.flatten.uniq.select{|c| range.include? c}
	end


		



end