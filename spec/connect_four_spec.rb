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
end