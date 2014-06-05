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
		ship = Ship.new ['A1']
		board.build(ship)
		board.register_shot_at 'A1'
		expect(board.representation['A1'].status).to eq :hit
	end

	it 'can have missed status' do
		ship = Ship.new ['A2']
		board.register_shot_at 'A1'
		expect(board.representation['A1'].status).to eq :missed
	end
end