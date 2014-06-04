class Ship

	SHIP_TYPES = [:battleship, :cruiser, :destroyer, :submarine]

	def initialize(coord_array)
		@coord_array = coord_array
		@size = set_size_according_to_coordinates(coord_array)
		@type = set_type_according_to_size(size)
		@status = :floating
		@hit_count = 0
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

	def hit_count
		@hit_count
	end

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

	def take_hit
		@hit_count += 1 unless @hit_count == @size
		hit_count == 1 ? message_modifier = "hit" : message_modifier = "hits" 
		@hit_count == size ? @status = :sunk : "#{@type} has taken #{hit_count} #{message_modifier}"
	end

end




