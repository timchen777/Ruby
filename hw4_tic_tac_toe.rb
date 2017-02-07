# This is the Ruby homework, create a Tic Tac Toe game

# Create class Player with name and game marker ( X,O )
Player = Struct.new(:name, :marker)

class Game
  # Winning game game_result collection
  @@win = [[0, 1 ,2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
          [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize
    puts "------ RUBY Homework : TicTacToe game -----------\n"
    puts "Player 1 name : "
    name1 = gets.chomp
    puts "Player 2 name: "
    name2 = gets.chomp
    @player1 = Player.new(name1, :X)
    @player2 = Player.new(name2, :O)
    @winner = nil
    #TicTacToe game board has positions 1~9
    @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"] 
  end

  def show_board
    # show 3 rows game board on the screen
    puts @board.each_slice(3) { |row| puts row.join(" | ") }
  end

  def play
    @turn = 1
    begin
      if @turn % 2 == 1
        play_by(@player1)
      else
        play_by(@player2)
      end
      @turn += 1
    end until @turn > 9 || @winner
    game_result
    play_again?
  end

  def play_by(player)
  # Gets players input and checks if it is a number 1-9, then check the winner
    begin
      input = false
      show_board
      puts "#{player.name} \'s turn, select your #{player.marker} position."
      input_position = gets.chomp.to_i
      if input_position > 0 && input_position <= 9
        input_position = input_position - 1
        if (@board[input_position] == :X || @board[input_position] == :O)
          puts "This position taken, pick another position."
        else
          input = true
          @board[input_position] = player.marker
          #check if winner exist ( when player's marker is one of the @@win collection )
          @@win.each do |i|
            @winner = player if i.all? { |x| @board[x] == player.marker }
          end
        end
      else
        puts "Invalid input. Please type number 1 ~ 9.\n\n"
      end
    end until input == true
  end

  def game_result
  # Displays game_result of the game
    show_board
    if @turn > 9 && !@winner
      puts "It's a tie! "
    else
      puts "#{@winner.name} won!"
    end
  end

  def play_again?
    puts "Please hit y if you like to play again :"
    response = gets.chomp.downcase
    if response == "y"
      Game.new.play
    else
      puts "Bye!"
      exit
    end
  end

end

Game.new.play