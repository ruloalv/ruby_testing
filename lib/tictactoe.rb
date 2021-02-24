class Game
  attr_reader :xs, :os, :board2

  def initialize(board = {1=> "1", 2=> "2", 3=> "3", 4=> "4", 5=> "5", 6=> "6", 7=> "7", 8=> "8", 9=> "9"})
    
    @xs = 0
    @os = 0
    @board2 = board
    
  end
  
  def print_board
    @board2.each do|k,v| 
      if k.to_i % 3 == 0
        puts "|#{v}|"
      else
        print "|#{v}"
      end
    end
    puts "-----------"
  end

  def play(num,simbol)
    
    if @board2.has_key?(num)
      if @board2[num].to_i == num
        @board2[num] = simbol
        simbol=="X"? @xs+=1: @os+=1
        puts "Jugo #{simbol} y sede el turno"
        system("clear")
        print_board
        puts "Jugadas de X: #{@xs} - Jugadas de O: #{@os}"
        
        return true
      else
        puts "ERROR: La casilla ya está ocupada"
        return false
      end
    else
      puts "ERROR: Se debe elegir una casilla entre 1 y 9"
      return false
    end
  end

  def check_win
    if @board2[1]==@board2[2] && @board2[1]==@board2[3] || @board2[1]==@board2[4] && @board2[1]==@board2[7]
      winner = @board2[1]
    elsif @board2[3]==@board2[6] && @board2[3]==@board2[9] || @board2[7]==@board2[8] && @board2[7]==@board2[9]
      winner = @board2[9]
    elsif @board2[5]==@board2[2] && @board2[5]==@board2[8] || @board2[5]==@board2[4] && @board2[5]==@board2[6] || @board2[5]==@board2[1] && @board2[5]==@board2[9] || @board2[5]==@board2[3] && @board2[5]==@board2[7]
      winner = @board2[5]
    else
      winner = false
    end
    return winner
  end
end

#b = Game.new()
#b.print_board


#player = "X"
#winner = b.check_win

#until winner || (b.xs + b.os == 9) do
#  puts "#{player} Plays. Choose a number"
#  p = gets.chomp.to_i
#  if b.play(p, player) 
#    player == "X"? player = "O": player = "X"
#  end
#  winner = b.check_win
#end

#if winner
#  puts "THE WINNER IS #{winner}"
#else
#  puts "There ir no winner, better luck next time"
#end
