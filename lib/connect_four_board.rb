class Board
	attr_reader :grid
	BLACK = "\u25CF".encode('utf-8')
	WHITE = "\u25CB".encode('utf-8')

	def initialize
		@grid = Array.new(6,Array.new(7,' '))
	end

	def print_board
		6.times { |i| puts '|' + @grid[i].join('|') + '|'  }
	end

	def game_over?
		four_in_col?(@grid) || four_in_row?(@grid) || four_in_diag?(@grid) || full_board?(@grid)
	end

	def four_in_col?(board)
	end

	def four_in_row?(board)
	end

	def four_in_diag?(board)
	end

	def full_board?(board)
	end
end

