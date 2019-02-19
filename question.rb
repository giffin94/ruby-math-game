class Question

  def initialize()
    @num1 = rand(100)
    @num2 = rand(100)
  end

  def ask_question()
    "What is #{@num1} plus #{@num2}? "
  end  

  def is_correct?(ans)
    ans == @num1 + @num2
  end
end