require_relative 'connect_four_board.rb'

class Connect_four
	attr_reader :player1, :player2, :board, :turn
	def initialize
		@board = Board.new
		@player1 = 'white'
		@player2 = 'black'
		@turn = @player2
	end

	def play(turn)
		puts 'Welcome to Connect Four Games:'
		puts "Its #{turn} turn:"
		@board.print_board
		print 'Choose a column number (0 to 6) to play your token o 7 to exit: '
	end

	def play_loop
		while !@board.game_over? do
			@turn = @turn == @player1 ? @player2 : @player1
			play(@turn)
			column = gets.chomp.to_i
			break if column == 7
			if @board.valid_input(column)
				@board.play(column, @turn)
			elsif !@board.not_full(column)
				puts 'This column is full please choose another column to play'
			else
				puts 'Error: invalid number of column, please choose a number beetwen 1 and 6'
			end
			system('clear')
		end
		play(@turn)
		puts
		if @board.full_board?
			puts "Its a withdraw"
		elsif @board.check_win
			puts "Congratulatios #{@turn} you win the game"
		else
			puts 'Bye, restart the game if you want to play again'
		end
	end
end

connect_four = Connect_four.new
connect_four.play_loop