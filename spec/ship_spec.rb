require 'ship'

describe Ship do

	let(:ship) {Ship.new([:A1])}

	it 'has some coordinates' do
		expect(ship.coordinates).to eq [:A1]
	end


	it 'will be hit when shot at' do
		expect(ship.hit(:A1)).to be_hit 
	end

	it 'is not hit by default' do
		expect(ship).not_to be_hit
	end

	it 'is not sunk' do
		expect(ship).not_to be_sunk
	end

	it 'will sink' do
		ship.hit(:A1)
		expect(ship).to be_sunk
	end

	it 'cannot be hit at wrong coordinate' do
		expect(ship.can_be_hit_at?(:A2)).to be_false
	end

	it 'cannot be hit twice' do
		ship.hit(:A1)
		expect(ship.can_be_hit_at?(:A1)).to be_false
	end

	context 'a bigger ship' do
		let(:ship) {Ship.new([:A1,:A2])}

		it 'will sink if hit sufficient times' do
			ship = Ship.new([:A1,:A2])
			ship.hit(:A1)
			expect(ship).not_to be_sunk
		end

		it 'cannot be hit twice at the same coordinate' do
			ship.hit(:A1).hit(:A1)
			# expect(ship.instance_variable_get(:@hits).count).to eq 1
			expect(ship.hits.count).to eq 1
		end

	end

end