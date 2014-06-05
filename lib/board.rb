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

	def register_shot_at coordinate
		status = representation[coordinate].shoot!
		ship_holder.each{|ship| ship.hit_cells(self)}
		ship_holder.each{|ship| ship.take_hit}
		# status
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

	# def find_surrounding_coordinates(new_ship)
	# 	surrounding_coordinates = new_ship.coordinates.map do |coordinate|
	# 		split_coordinate = coordinate[0].chars
	# 		letter = split_coordinate[0]
	# 		number = split_coordinate[1].to_i
	# 		letters = []
	# 		letters << (letter.ord-1).chr
	# 		letters << letter
	# 		letters << letter.next
	# 		numbers = []
	# 		numbers << (number - 1)
	# 		numbers << number
	# 		numbers << (number + 1)
	# 		numbers.map! { |element| element.to_s }
	# 		combo = letters.product(numbers)
	# 		combo.map! { |element| element.join }
	# 		combo - new_ship.coordinates
	# 	end
	# end

end