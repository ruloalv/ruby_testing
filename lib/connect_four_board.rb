class Board
	attr_reader :grid, :plays
	BLACK = "\u25CF".encode('utf-8')
	WHITE = "\u25CB".encode('utf-8')

	def initialize (grid = Array.new(7) {Array.new(6,' ')})
		@grid = grid
		@plays = 0
	end

	def print_board
		puts ' |0|1|2|3|4|5|6|'
		6.times do |r|
			print r
			7.times do |c| 
				print '|' + @grid[c][r] 
			end
			puts '|'
		end
	end

	def game_over?
		four_in_col?(@grid) || four_in_row?(@grid) || four_in_diag?(@grid) || full_board?
	end

	def four_in_col?(board)
		7.times do |column|
			return true if board[column].join('').include?(BLACK * 4) || board[column].join('').include?(WHITE * 4)
		end
		return false
	end

	def four_in_row?(board)
		t_board = board.transpose
		6.times do |row|
			return true if t_board[row].join('').include?(BLACK * 4) || t_board[row].join('').include?(WHITE * 4)
		end
		return false
	end

	def four_in_diag?(board)
		win = (four_right_diag?(board) || four_left_diag?(board))
		return win
	end

	def four_right_diag?(board)
		0.upto(3) do |c|
			0.upto(2) do |r|
				return true if board[c][r] == board[c+1][r+1] && board[c][r] == board[c+2][r+2] && board[c][r] == board[c+3][r+3] && board[c][r] != ' '
			end
		end
		return false
	end

	def four_left_diag?(board)
		0.upto(3) do |c|
			5.downto(3) do |r|
				return true if board[c][r] == board[c+1][r-1] && board[c][r] == board[c+2][r-2] && board[c][r] == board[c+3][r-3] && board[c][r] != ' '
			end
		end
		return false
	end

	def full_board?
		@plays == 42
	end

	def check_win(board = @grid)
		four_in_diag?(board) || four_in_row?(board) || four_in_col?(board)
	end

	def not_full(column)
		@grid[column].include?(' ')
	end

	def drop_token(column, token)
		row = @grid[column].count(' ')-1
		@grid[column][row] = token == 'black' ? BLACK : WHITE
		@plays += 1
	end

	def valid_input(column)
		(0..6).include?(column)
	end

	def play(column, token)
		
		if not_full(column) && valid_input(column)
			drop_token(column, token)
			return true
		end
		
		return false
	end

end

#b = Board.new([['0.0', '0.1', '0.2', '0.3','0.4','0.5','0.6'],['1.0','1.1','1.2','1.3','1.4','1.5','1.6'],['2.0','2.1','2.2','2.3','2.4','2.5','2.6'],['3.0','3.1','3.2','3.3','3.4','3.5','3.6'],['4.0','4.1','4.2','4.3','4.4','4.5','4.6'],['5.0','5.1','5.2','5.3','5.4','5.5','5.6']])
#b.print_board

#b1 = Board.new([['X', 'O', 'X', 'X',' ',' ','X'],[' ',' ','X',' ',' ','X',' '],[' ',' ',' ','O','X',' ',' '],[' ',' ',' ','X','O',' ',' '],[' ',' ','X',' ',' ',' ',' '],[' ','X',' ',' ',' ',' ',' ']])
#b1.print_board

# b2 = Board.new([['X', 'X', ' ', 'X',' ',' '],[' ',' ','O','O','X','O'],[' ',' ',' ',' ',' ','X',],[' ',' ',"\u25CF".encode('utf-8'),' ',' ',' '],[' ',' ',' ',"\u25CF".encode('utf-8'),' ',' ',],[' ',' ',' ',' ',"\u25CF".encode('utf-8'),' '],[' ',' ',' ',' ',' ',"\u25CF".encode('utf-8')]])
# b2.print_board
# puts b2.four_right_diag?(b2.grid)

#b3_four_in_col = Board.new([["\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'),"\u25CF".encode('utf-8'),"\u25CF".encode('utf-8')],["\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'),"\u25CF".encode('utf-8'),"\u25CF".encode('utf-8')],["\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'),"\u25CF".encode('utf-8'),"\u25CF".encode('utf-8')],[' ', ' ', ' ', ' ', ' ', ' '],["\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'),"\u25CF".encode('utf-8'),"\u25CF".encode('utf-8')],["\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'),"\u25CF".encode('utf-8'),"\u25CF".encode('utf-8')],["\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'), "\u25CF".encode('utf-8'),"\u25CF".encode('utf-8'),"\u25CF".encode('utf-8')]])
#b3_four_in_col.print_board
#puts b3_four_in_col.four_in_col?(b3_four_in_col.grid)
#puts b3_four_in_col.four_in_row?(b3_four_in_col.grid)

# b3_four_in_row = Board.new([[' ', ' ', ' ', ' ',' ',"\u25CB".encode('utf-8')],[' ', ' ', ' ', "\u25CF".encode('utf-8'),"\u25CB".encode('utf-8'),"\u25CB".encode('utf-8')],[' ', ' ', ' ', "\u25CF".encode('utf-8'),"\u25CB".encode('utf-8'),"\u25CF".encode('utf-8')],[' ', ' ', ' ', "\u25CB".encode('utf-8'),"\u25CF".encode('utf-8'),"\u25CB".encode('utf-8')],[' ', ' ', "\u25CB".encode('utf-8'), "\u25CB".encode('utf-8'),"\u25CB".encode('utf-8'),"\u25CF".encode('utf-8')],[' ', ' ', ' ', ' ',' ',"\u25CF".encode('utf-8')],[' ', ' ', ' ', ' ',"\u25CF".encode('utf-8'),"\u25CF".encode('utf-8')]])
# b3_four_in_row.print_board
# puts b3_four_in_row.four_left_diag?(b3_four_in_row.grid)
#puts b3_four_in_row.four_right_diag?(b3_four_in_row.grid)

