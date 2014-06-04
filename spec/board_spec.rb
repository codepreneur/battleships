require 'board'
# require 'cell'

describe Board do

	let(:board) { Board.new }

	context 'at initialization' do
		it 'is a hash' do
			expect(board.representation.class).to eq Hash
		end

		it 'has 100 elements' do
			expect(board.representation.count).to eq 100
		end 

		it 'each value is a Cell object' do
			board.representation.values.each do |cell|
				expect(cell.class).to eq Cell
			end
		end

		it 'contains cell objects with empty status' do
			board.representation.values.each do |cell|
				expect(cell.status).to eq :empty
			end
		end
	end

	context 'Board\'s relation-ship' do

		xit 'knows that it has a ship' do
			ship = double :ship
			board.place(ship)
			board.representation.values.any? do |cell|
				expect(cell.status).to eq :ship
			end
		end

		it 'can build a ship' do
		ship1 = double :ship1, coordinates: ["A1", "A2", "A3"]
		cell.build(ship1, board)
		["A1", "A2", "A3"].all? do |coord|
			expect(board.representation[coord].status).to eq :ship
		end
	end

		it 'knows when a ship is sunk'

		it 'knows it has ten ships placed'

		it 'knows when all the ships are sunk'

	end

	it 'communicates to the game that all the ships are sunk'

	it 'informs the opponent\'s board about each hit(??)'

end