class Board

	DEFAULT_CAPACITY = 5

	attr_writer :capacity

	def initialize(options={})
		@representation = create_empty_grid
		self.capacity = options.fetch(:capacity, capacity)
	end

	def representation
		@representation
	end

	def create_empty_grid
		grid = {}
		("A".."J").to_a.each {|letter| (1..10).to_a.each {|number| grid["#{letter}#{number}"] = Cell.new}}
		grid
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def build(ship)
		# ship.coordinates expected to return an array ["A1", "A2", "A3"]
		ship.coordinates.map do |coord|
			representation[coord].status = :ship
		end
		
		add_to_board(ship)
	end	

	def add_to_board(ship)
		raise RuntimeError if number_of_ships >= 10
		raise OverlappingShips if overlapping_ships?(ship)
		ship_holder << ship
	end

	def ship_holder
		@ship_holder ||= []
	end

	def number_of_ships
		ship_holder.count
	end

	def sunk_ship_holder
		ship_holder.select{|ship| ship.status == :sunk}
	end

	def overlapping_ships?(new_ship)
		overlapping = ship_holder.map do |ship|
			ship.coordinates.any? do |coord1| 
				new_ship.coordinates.any? do |coord2| 
					coord1 == coord2 
				end
			end
		end
		overlapping.include?(true)
	end

end