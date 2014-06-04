require 'cell'
require 'board'

describe Cell do

	let(:cell) { Cell.new }
	let(:board) { Board.new }

	it 'has empty status when initialized' do
		expect(cell.status).to eq :empty
	end

	it 'can have a ship status' do
		cell.ship!
		expect(cell.status).to eq :ship
	end

	it 'can have hit status' do
		board.representation["A1"].status = :ship
		cell.attempt "A1",board
		expect(cell.status).to eq :hit
	end

	it 'can have missed status' do
		cell.attempt "A1",board
		expect(cell.status).to eq :missed
	end

	it 'can build a ship' do
		ship1 = double :ship1, coordinates: ["A1", "A2", "A3"]

		cell.build(ship1, board)
		["A1", "A2", "A3"].all? do |coord|
			expect(board.representation[coord].status).to eq :ship
		end
	end
end