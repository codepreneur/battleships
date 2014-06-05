require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/errors'

@board = Board.new
@ship = Ship.new ["J9", "J10"]
@board.build(@ship)
@board.register_shot_at 'J9'
@board.register_shot_at 'J10'