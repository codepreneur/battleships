class Ship

	SHIP_TYPES = [:battleship, :cruiser, :destroyer, :submarine]

	def initialize(size)
		@size = size
		@type = set_type_according_to_size(size)
    	raise ArgumentError.new("Ship size must be between 1-4") unless SHIP_TYPES.include?(@type)
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

	def sink
		(@status == :floating) ? @status = :sunk : "ship already sunk"
	end

	def take_hit
		@hit_count += 1 unless @hit_count == @size
		@hit_count == size ? @status = :sunk : "#{@type} has taken #{hit_count} hit"
	end

end




