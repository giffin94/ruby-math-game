class Game

  attr_accessor :current_player
  attr_reader :turn

  def initialize()
    print "Welcome! If you're here to pit your mathematical chops against your friend, enter a name for Player 1: "
    @player_1 = Player.new(gets.chomp)
    print "Player 2: "
    @player_2 = Player.new(gets.chomp)
    # @player_1 = p1
    # @player_2 = p2
    @current_player = @player_1
    puts "Today's player's are: #{@player_1.name} and #{@player_2.name}."
    puts "It's your turn, #{@current_player.name}, press ENTER to start."
    gets
    new_turn()
  end

  def new_turn()
    question = Question.new()
    puts "It's #{@current_player.name}'s turn."
    print "#{question.ask_question()}: "
    check_status(question)
    check_lives()
  end 
  
  def check_status(question)
    if question.is_correct?(gets.chomp.to_i)
      puts "Correct!"
    else
      puts "Uh-oh! That's not right..."
      @current_player.lives -= 1    
    end
  end

  def check_lives()
    if @player_1.lives > 0 && @player_2.lives > 0
      puts "End of #{@current_player.name}'s turn.\n *** #{@player_1.name}: #{@player_1.lives}/3 vs. #{@player_2.name}: #{@player_2.lives}/3 ***"
      @current_player = player_opposite()
      new_turn()
    else
      winner(player_opposite())
    end
  end

  def winner(player)
    puts "GAME OVER! #{player.name} wins with #{player.lives}/3 lives remaining."
  end

  def player_opposite()
    @current_player == @player_1 ? @player_2 : @player_1
  end

end