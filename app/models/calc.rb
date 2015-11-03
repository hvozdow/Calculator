class Calc

  attr_accessor :result
  
  def initialize
    @operator = ''
    @firstNumber = 0
    @secondNumber = 0
    @flag_op = false
    @result = "0"
  end
  
  def clear
    initialize
  end
  
  # Display int number without the .0 at the end
  # ==== Attributes 
  # +number+ - The number to display 
  def display(number)
    number % 1 == 0 ? number.to_i.to_s : number.to_s
  end
  
  # Add the new num (digit) to the actual number
  # Depending if the actual number is whole or not, add the digit before or after the coma
  # ==== Attributes 
  # +number+ - The number to add the new char (digit)
  # +num+ - The char to add at the end of the number
  def add(number, num)
    number % 1 == 0 ? (number.to_i.to_s + num).to_f : (number.to_s + num).to_f
  end

  # Store operator entered by the user
  # If an operator was already entered by the user before, then first eval 
  # and after add the operator with the result obtained
  # ==== Attributes 
  # +op+ - The operation entered by the user
  def operator(op)
    if @flag_op
      eval
      operator(op)
    else
      @flag_op = true
      @operator = op
      @result += op
    end
  end
  
  def number(num)
    if !@flag_op
      @firstNumber = add(@firstNumber, num)
      @result = display(@firstNumber)
    else
      @secondNumber = add(@secondNumber, num)
      @result = display(@firstNumber) + @operator + display(@secondNumber)
    end
  end
  
  def eval
    case @operator
      when '+'
        @firstNumber = @firstNumber + @secondNumber
      when '-'
         @firstNumber = @firstNumber - @secondNumber
      when 'x'
         @firstNumber = @firstNumber * @secondNumber
      when '÷'
         @firstNumber = @firstNumber / @secondNumber
      else
        # If no operator was entered or no second member of the operation to do, then display the first member
        @firstNumber = @firstNumber
    end
    @result = display(@firstNumber)
    @secondNumber = 0
    @flag_op = false
  end
  
end