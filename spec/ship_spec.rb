require 'ship'

describe Ship do

	# let(:ship) { Ship.new }

	it "can be initialized as a battleship" do
		ship = Ship.new(4)
		expect(ship.type).to eq :battleship
	end

	it "can be initialized as a cruiser" do
		ship = Ship.new(3)
		expect(ship.type).to eq :cruiser
	end

	it "can be initialized as a destroyer" do
		ship = Ship.new(2)
		expect(ship.type).to eq :destroyer
	end

	it "can be initialized as a submarine" do
		ship = Ship.new(1)
		expect(ship.type).to eq :submarine
	end

	it "has a size of 4 if it\'s a battleship" do
		ship = Ship.new(4)
		expect(ship.size).to eq 4
	end		

	it "has a size of 3 if it\'s a cruiser" do
		ship = Ship.new(3)
		expect(ship.size).to eq 3
	end		

	it "has a size of 2 if it\'s a destroyer" do
		ship = Ship.new(2)
		expect(ship.size).to eq 2
	end		

		it "has a size of 1 if it\'s a submarine" do
		ship = Ship.new(1)
		expect(ship.size).to eq 1
	end		

	it "must be initialized with a specific size" do
		expect(lambda{Ship.new}).to raise_error(ArgumentError)
	end

	it "must be initialized with a size between 1-4" do
		expect(lambda{Ship.new(0)}).to raise_error(ArgumentError)
		expect(lambda{Ship.new(5)}).to raise_error(ArgumentError)
		expect(lambda{Ship.new("a")}).to raise_error(ArgumentError)
	end

	it 'is floating when first created' do
		ship = Ship.new(4)
		expect(ship.status).to eq :floating
	end

	it "knows if it\'s floating" do

		ship = Ship.new(4)
		expect(ship.floating?).to be_true
		expect(ship.sunk?).to be_false
	end

	it "can sink" do
		ship = Ship.new(4)
		ship.sink
		expect(ship.status).to eq :sunk		
	end

	it "knows if it\'s sunk" do
		ship = Ship.new(4)
		ship.sink
		expect(ship.sunk?).to be_true
		expect(ship.floating?).to be_false
	end

	it "cannot be sunk more than once" do

		ship = Ship.new(4)
		ship.sink
		expect(ship.sink).to eq "ship already sunk"

	end

	it "keeps track of the hits it takes" do
		ship = Ship.new(4)
		expect(ship.hit_count).to eq 0
		ship.take_hit
		expect(ship.hit_count).to eq 1

	end

	it "sinks if it\'s hit count reaches it\'s size" do
		ship = Ship.new(2)
		ship.take_hit
		ship.take_hit
		expect(ship.status).to eq :sunk
	end


	xit "has a location" do 

	end



	xit "occupies a specific set of spaces on the grid" do


	end



	# it 'is sunk when all of its lives are taken' do
	# 	ship = Ship.new(2)
	# 	puts ship.hits.inspect
	# 	2.times { ship.receives_hit }
	# 	puts ship.hits.inspect
	# 	expect(ship.sunk?).to be_true
	# end

	# it 'has a size when initialised' do
	# 	ship = Ship.new(size: 4)
	# 	expect(ship.size).to eq 4
	# end

	# it 'can be hit' do
	# 	expect(ship).to receive(:hit)
	# end
end

