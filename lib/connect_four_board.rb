class Board
	attr_reader :grid, :plays
	BLACK = "\u25CF".encode('utf-8')
	WHITE = "\u25CB".encode('utf-8')

	def initialize (grid = Array.new(7,Array.new(6,' ')))
		@grid = grid
		@plays = 0
	end

	def print_board
		6.times { |i| puts '|' + @grid[i].join('|') + '|'  }
	end

	def game_over?
		four_in_col?(@grid) || four_in_row?(@grid) || four_in_diag?(@grid) || full_board?(@grid)
	end

	def four_in_col?(board)
		7.times do |column|
			return true if board[column].join('').include?('XXXX') || board[column].join('').include?('OOOO')
		end
		return false
	end

	def four_in_row?(board)
		t_board = board.transpose
		6.times do |row|
			return true if t_board[row].join('').include?('XXXX') || t_board[row].join('').include?('OOOO')
		end
		return false
	end

	def four_in_diag?(board)
		win = (four_right_diag?(board) || four_left_diag?(board))
		return win
	end

	def four_right_diag?(board)
		0.upto(2) do |c|
			0.upto(3) do |r|
				return true if board[c][r] == board[c+1][r+1] && board[c][r] == board[c+2][r+2] && board[c][r] == board[c+3][r+3] && board[c][r] != ' '
			end
		end
		return false
	end

	def four_left_diag?(board)
		0.upto(2) do |c|
			6.downto(3) do |r|
				return true if board[c][r] == board[c+1][r-1] && board[c][r] == board[c+2][r-2] && board[c][r] == board[c+3][r-3] && board[c][r] != ' '
			end
		end
		return false
	end

	def full_board?(board)
		@plays == 42
	end

	def check_win(board)
		four_in_diag?(board) || four_in_row?(board) || four_in_col?(board)
	end
end

#b = Board.new([['0.0', '0.1', '0.2', '0.3','0.4','0.5','0.6'],['1.0','1.1','1.2','1.3','1.4','1.5','1.6'],['2.0','2.1','2.2','2.3','2.4','2.5','2.6'],['3.0','3.1','3.2','3.3','3.4','3.5','3.6'],['4.0','4.1','4.2','4.3','4.4','4.5','4.6'],['5.0','5.1','5.2','5.3','5.4','5.5','5.6']])
#b.print_board

#b1 = Board.new([['X', 'O', 'X', 'X',' ',' ','X'],[' ',' ','X',' ',' ','X',' '],[' ',' ',' ','O','X',' ',' '],[' ',' ',' ','X','O',' ',' '],[' ',' ','X',' ',' ',' ',' '],[' ','X',' ',' ',' ',' ',' ']])
#b1.print_board

#b2 = Board.new([['X', 'X', ' ', 'X',' ',' ',' '],[' ',' ','O','O','X','O',' '],[' ',' ',' ',' ','O',' ',' '],[' ',' ',' ','O',' ',' ',' '],[' ','O','O',' ',' ',' ',' '],[' ',' ',' ',' ',' ',' ',' ']])
#b2.print_board