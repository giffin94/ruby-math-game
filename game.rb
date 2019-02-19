class Game

  attr_accessor :current_player
  attr_reader :turn

  def initialize(p1, p2)
    @player1 = p1
    @player2 = p2
    @current_player = @player1
    @turn = 1;
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
    if @player1.lives > 0 && @player2.lives > 0
      puts "End of #{@current_player.name}'s turn.\n *** #{@player1.name}: #{@player1.lives}/3 vs. #{@player2.name}: #{@player2.lives}/3 ***"
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
    @current_player == @player1 ? @player2 : @player1
  end

end