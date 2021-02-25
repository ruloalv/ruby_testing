class Board
	attr_reader :grid
	BLACK = "\u25CF".encode('utf-8')
	WHITE = "\u25CB".encode('utf-8')

	def initialize (grid = Array.new(6,Array.new(7,' ')))
		@grid = grid
	end

	def print_board
		6.times { |i| puts '|' + @grid[i].join('|') + '|'  }
	end

	def game_over?
		four_in_col?(@grid) || four_in_row?(@grid) || four_in_diag?(@grid) || full_board?(@grid)
	end

	def four_in_col?(board)
		6.times do |column|
			return true if board[column].join('').include?('XXXX') || board[column].join('').include?('OOOO')
		end
		return false
	end

	def four_in_row?(board)
		t_board = board.transpose
		7.times do |row|
			return true if t_board[row].join('').include?('XXXX') || t_board[row].join('').include?('OOOO')
		end
		return false
	end

	def four_in_diag?(board)
		four_right_diag?(board) || four_left_diag?(board)
	end

	def four_right_diag?(board)
		0.upto(3) do |c|
			0.upto(2) do |r|
				return true if board[c][y] == board[c+1][y+1] && board[c][y] == board[c+2][y+2] && board[c][y] == board[c+3][y+3] && board[c][y] != " "
			end
		end
		return false
	end

	def four_left_diag?(board)
	end

	def full_board?(board)
	end
end

