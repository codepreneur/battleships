class Game

	def initialize
		@player_list ||= []
		@player_count = 0
		@turn = :player_one
	end

	def player_count
		@player_count = player_list.length
	end

	def add_player(player)
		player_list << player
	end

  def player_list
  	@player_list
  end

  def whose_turn?
  	@turn
  end

  def display(board)
    arr = []
    board.representation.values.each_slice(10){|row| arr << row}
    arr = arr.map{|row| row.map {|cell| cell.status}}
    arr.each{|row| p row}
  end

  def instructions
    inst = "Welcome to Battleships!\n"
    inst += "Coordinates Range from A1 to J10\n"
    inst += "battleship, cruiser, destroyer, submarine\n"
    inst += "right, left, up, down\n"
  end

  def setup(board)
    puts instructions
    until board.number_of_ships == 10
      _coords = get_coordinates
      ship = Ship.new(_coords.split(','),board)
      board.build(ship)
      display(board)
    end
  end

  def attack(board)
    _target = target_coord
    board.register_shot_at _target
    display(board)
  end

  def target_coord
    puts "Which coordinate do you want to attack?"
    gets.chomp
  end
  	

  def get_coordinates
    puts "Ship coordinates separated by ',' please\n"
    gets.chomp
  end



  def switch_turn
  	whose_turn? == :player_one ? @turn = :player_two : @turn = :player_one
  end

end