class Board

	DEFAULT_CAPACITY = 10

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
		raise "Too many ships!" if number_of_ships >= 10
		raise "Too many battleships!!" if number_of_battleships >= 1 
		raise "Too many cruisers!!" if number_of_cruisers >= 2 
		raise "Too many destroyers!!" if number_of_destroyers >= 3
		raise "Too many submarines!!" if number_of_submarines >= 4  
		ship_holder << ship
	end

	def ship_holder
		@ship_holder ||= []
	end

	def number_of_battleships
		ship_holder.select{|n| n.type == :battleship}.count
	end

	def number_of_cruisers
		ship_holder.select{|n| n.type == :cruiser}.count
	end

	def number_of_destroyers
		ship_holder.select{|n| n.type == :destroyer}.count
	end

	def number_of_submarines
		ship_holder.select{|n| n.type == :submarine}.count
	end

	def number_of_ships
		ship_holder.count
	end

	def register_shot_at coordinate
		status = representation[coordinate].shoot!
		ship_holder.each{|ship| ship.hit_cells(self)}
		ship_holder.each{|ship| ship.take_hit}
	end

	def sunk_ship_holder
		ship_holder.select{|ship| ship.status == :sunk}
	end


end