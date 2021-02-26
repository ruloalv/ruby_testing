require_relative '../lib/connect_four'
require_relative '../lib/connect_four_board'

describe Board do
	subject(:board_new) {described_class.new}

	describe '#initialize' do
		context 'when create a new board' do
			it 'doesnt have a nil grid' do
				expect(board_new).not_to be_nil
			end

			let(:new_grid) {Array.new(6,Array.new(7,' '))}
			it 'is equal to new_grid' do
				expect(board_new.grid).to eq(new_grid)
			end
		end
	end

	describe '#game_over?' do
		subject(:board_game_over) {described_class.new}
		#let(:win_board) {Array.new(6,Array.new(7,' '))}

		before do
			allow(board_game_over).to receive(:four_in_col?).and_return(true)
			allow(board_game_over).to receive(:four_in_row?).and_return(false)
			allow(board_game_over).to receive(:four_in_diag?).and_return(false)
			allow(board_game_over).to receive(:full_board?).and_return(false)
		end

		context 'if 4 pieces connected' do
			it 'return true' do
				expect(board_game_over).to be_game_over
			end
		end
		context 'if board is full' do
			it 'return true' do
				expect(board_game_over).to be_game_over
			end
		end

		context 'if board is not full and there isnt 4 pieces connected' do
			it 'return false' do
				allow(board_game_over).to receive(:four_in_col?).and_return(false)
				expect(board_game_over).not_to be_game_over
			end
		end
	end

	describe '#four_in_col?' do
		subject(:board_four_col) {described_class.new(grid)}

		context 'when there are four of the same simbols together on the same col' do
			let(:grid) {[['X', 'X', 'X', 'X',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'return true' do
				expect(board_four_col.four_in_col?(grid)).to be(true)
			end

			let(:grid) {[['X', 'X', ' ', ' ',' ',' ',' '],[' ',' ','O','O','O','O',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'return true' do
				expect(board_four_col.four_in_col?(grid)).to be(true)
			end
		end
	end

	describe '#four_in_row?' do
		subject(:board_four_row) {described_class.new(grid)}
		
		context 'when there are four of the same simbols together on the same row' do
			let(:grid) {[[' ', ' ', ' ', ' ',' ',' ',' '],['X',' ',' ',' ',' ',' ',' '],['X',' ',' ',' ',' ',' ',' '],['X',' ',' ',' ',' ',' ',' '],['X',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'return true' do
				expect(board_four_row.four_in_row?(grid)).to be(true)
			end

			let(:grid) {[['X', 'X', ' ', ' ',' ',' ',' '],[' ',' ','O',' ',' ',' ',' '],[' ',' ','O',' ',' ',' ',' '],[' ',' ','O',' ',' ',' ',' '],[' ',' ','O',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'return true' do
				expect(board_four_row.four_in_row?(grid)).to be(true)
			end
		end
	end

	describe '#four_in_diag?' do
		subject(:board_four_diag) {described_class.new(grid)}
		context '#when there are four of the same simbols together on the same diag' do
			let(:grid) {[['X', 'O', 'X', 'X',' ',' ',' '],[' ',' ','O',' ',' ',' ',' '],[' ',' ',' ','O',' ',' ',' '],[' ',' ',' ',' ','O',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'when tokens are in left diag return true' do
				expect(board_four_diag.four_in_diag?(grid)).to be(true)
			end

			let(:grid) {[['X', 'X', ' ', 'X',' ',' ',' '],[' ',' ','O','O','X','O',' '],[' ',' ',' ',' ',' ','X',' '],[' ',' ',' ',' ',' ',' ','X'],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'when tokens are in left diag return true' do
				expect(board_four_diag.four_in_diag?(grid)).to be(true)
			end

			let(:grid) {[['X', 'O', 'X', 'X',' ',' ','X'],[' ',' ','X',' ',' ','X',' '],[' ',' ',' ','O','X',' ',' '],[' ',' ',' ','X','O',' ',' '],[' ',' ','X',' ',' ',' ',' '],[' ','X',' ',' ',' ',' ',' ']]}
			it 'when tokens are in right diag return true' do
				expect(board_four_diag.four_in_diag?(grid)).to be(true)
			end

			let(:grid) {[['X', 'X', ' ', 'X',' ',' ',' '],[' ',' ','O','O','X','O',' '],[' ',' ',' ',' ','O',' ',' '],[' ',' ',' ','O',' ',' ',' '],[' ','O','O',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'when tokens are in right diag return true' do
				expect(board_four_diag.four_in_diag?(grid)).to be(true)
			end
		end
		context 'when there arent any four token connected' do
			let(:grid) {[['X', 'X', ' ', 'X',' ',' ',' '],[' ',' ','O','O','X','O',' '],[' ',' ',' ',' ','O',' ',' '],[' ',' ',' ','O',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'expect to return false' do
				expect(board_four_diag.four_in_diag?(grid)).to be(false)
			end
		end
	end

	describe '#check_win' do
		subject(:board_check_win) {described_class.new(:grid)}
		context 'when given a board check if there are any winner' do
			let(:grid) {[['X', 'X', ' ', 'X',' ',' ',' '],[' ',' ','O','O','X','O',' '],[' ',' ',' ',' ','O',' ',' '],[' ',' ',' ','O',' ',' ',' '],[' ','O','O',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']]}
			it 'return true' do
				expect(board_check_win.check_win(grid)).to be(true)
			end
		end
	end

	describe '#play' do
		context
	end
end