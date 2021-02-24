require_relative '../lib/tictactoe'

describe Game do
	describe '#check_win' do
		subject(:game_win) {described_class.new(board)}
		
		context 'when XXX on top line of the board' do
			let(:board) {{1=> "X", 2=> "X", 3=> "X", 4=> "4", 5=> "5", 6=> "6", 7=> "7", 8=> "8", 9=> "9"}}
			it 'check_win return X' do
				expect(game_win.check_win).to eq('X')
			end
		end

		context 'when OOO on left-right diagonal' do
			let(:board) {{1=> "O", 2=> "2", 3=> "X", 4=> "4", 5=> "O", 6=> "6", 7=> "7", 8=> "8", 9=> "O"}}
			it 'check_win returns O' do
				expect(game_win.check_win).to eq('O')
			end
		end
	end

	describe '#play' do
		subject(:game_play) {described_class.new}

		context 'when play check board.has_key' do
			it 'the metod board need has_key' do
				expect(game_play.board2).to be_a(Hash)
				game_play.play('1', 'X')
			end
		end
	end

end