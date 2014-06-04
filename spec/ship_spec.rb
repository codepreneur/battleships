require 'ship'

describe Ship do

	# let(:ship) { Ship.new }

	it "can be initialized as a battleship" do
		ship = Ship.new([:A1, :A2, :A3, :A4])
		expect(ship.type).to eq :battleship
	end

	it "can be initialized as a cruiser" do
		ship = Ship.new([:A1, :A2, :A3])
		expect(ship.type).to eq :cruiser
	end

	it "can be initialized as a destroyer" do
		ship = Ship.new([:A1, :A2])
		expect(ship.type).to eq :destroyer
	end

	it "can be initialized as a submarine" do
		ship = Ship.new([:A1])
		expect(ship.type).to eq :submarine
	end

	it "has a size of 4 if it\'s a battleship" do
		ship = Ship.new([:A1, :A2, :A3, :A4])
		expect(ship.size).to eq 4
	end		

	it "has a size of 3 if it\'s a cruiser" do
		ship = Ship.new([:A1, :A2, :A3])
		expect(ship.size).to eq 3
	end		

	it "has a size of 2 if it\'s a destroyer" do
		ship = Ship.new([:A1, :A2])
		expect(ship.size).to eq 2
	end		

		it "has a size of 1 if it\'s a submarine" do
		ship = Ship.new([:A1])
		expect(ship.size).to eq 1
	end		

	it "must be initialized with a specific size" do
		expect(lambda{Ship.new}).to raise_error(ArgumentError)
	end

	# it "must be initialized with a size between 1-4" do
	# 	expect(lambda{Ship.new(0)}).to raise_error(ArgumentError)
	# 	expect(lambda{Ship.new(5)}).to raise_error(ArgumentError)
	# 	expect(lambda{Ship.new("a")}).to raise_error(ArgumentError)
	# end

	it 'is floating when first created' do
		ship = Ship.new([:A1, :A2, :A3, :A4])
		expect(ship.status).to eq :floating
	end

	it "knows if it\'s floating" do

		ship = Ship.new([:A1, :A2, :A3, :A4])
		expect(ship.floating?).to be_true
		expect(ship.sunk?).to be_false
	end

	it "can sink" do
		ship = Ship.new([:A1])
		ship.take_hit
		expect(ship.status).to eq :sunk		
	end

	it "knows if it\'s sunk" do
		ship = Ship.new([:A1])
		ship.take_hit
		expect(ship.sunk?).to be_true
		expect(ship.floating?).to be_false
	end

	# it "cannot be sunk more than once" do
	# 	ship = Ship.new(1)
	# 	ship.take_hit
	# 	expect(ship.sink).to eq "ship already sunk"
	# end

	it "keeps track of the hits it takes" do
		ship = Ship.new([:A1, :A2, :A3, :A4])
		expect(ship.hit_count).to eq 0
		ship.take_hit
		expect(ship.hit_count).to eq 1

	end

	it "sinks if its hit count reaches its size" do
		ship = Ship.new([:A1, :A2])
		ship.take_hit
		ship.take_hit
		expect(ship.status).to eq :sunk
	end


	# it "cannot be sunk if not taken maximum number of hits" do
	# 	ship = Ship.new(2)
	# 	expect(ship.sink).to eq "ship shouldn\'t sink yet"		

	# end

	it "has coordinates" do 
		sea_breeze = Ship.new([:A1])
		expect(sea_breeze.coordinates).to eq [:A1]

	end

	it "its coordinates must be given an array" do
		ship = Ship.new([:A1, :A2])	
		expect(ship.coordinates.is_a? Array).to be_true

	end

	it "isn't initialized if not given coordinates" do

		expect(lambda{Ship.new("a")}).to raise_error(ArgumentError)

	end




end

