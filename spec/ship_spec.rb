require 'ship'

describe Ship do
	


end

# player would give position, size, direction
    # 1. player.place('A1',2,'N')
    # inside place method --> Ship.new(A1',2,'N')
    # inside ship initialize --> checking rules
    # class Ship
    #   def initialize(board, coord, size, direction)
    #     @board = board
    #     @coord = coord
    #     @size = size
    #     checkValidPosition
    #   end
    #   def checkValidPosition
    #      calcCoords
    #       overlapWithOtherShips
    #       onBoard
    #       notAdjacent
           
    #   end
    #def overlapWithOtherShips
    #  @board.ships.each |s|
    #    overlapswith?(s)
    #end
    #def overlapswith? ship
    #end
    # end


    # 2. player.place('A1',2,'N')
    # check validity of place attempt
    # class Player
    #   def place(....)
    #     checkValidPosition(...)
    #   end
    # end
    # only initialise ship if valid



    # 3. board

    #board.checkForCollisions

    #def checkForCollisions
    #  @ships.pairs do |s1,s2|
   #     s1.overlapsWith(s2)
    #  end

   # end




