require 'game'

describe Game do
	let (:game) {Game.new}
	let (:player1) {Player.new}
	let (:player2) {Player.new}

	it 'has 2 players' do
		game.add_player(player1)
		game.add_player(player2)
		expect(game.player_count).to eq 2
	end

	it 'knows which 2 players it has' do
		game.add_player(player1)
		game.add_player(player2)
		expect(game.player_list).to eq [player1,player2]
	end

	it 'can begin' do
		expect(game.play).to eq "Welcome to Battleships!"

	end

	it "sets player one to play first" do
		expect(game.whose_turn?).to eq :player_one
	end

	it "can set turns between the two players" do
		expect(game.switch_turn).to eq :player_two

	end


	it 'can register a shot on other player\'s board' do
		player1.board.regiser_shot_at("A1")
		expect(board.representation["A1"].status).to eq :hit
	end


end