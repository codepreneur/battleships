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

  def play
  	"Welcome to Battleships!"

  end

  def switch_turn
  	whose_turn? == :player_one ? @turn = :player_two : @turn = :player_one
  end

end