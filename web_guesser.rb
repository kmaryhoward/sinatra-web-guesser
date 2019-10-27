class NumGuess
  attr_accessor :message, :guesses, :secret_number, :background


  def initialize
          @guesses = 4
          @secret_number = rand(20)
          @background = background
          @message = message
  end


 def check(guess)

          var1 = @secret_number + 5
          var2 = @secret_number - 5
          
          if guess > @secret_number
            if guess > var1 || guess == var1      
             @message = "Way too high"
             @background = 'red'
          else
              @message = "Too high"
              @background = 'blue'
          end
          elsif guess < @secret_number
            if guess < var2 || guess == var2
              @message = "Way too low"
              @background = 'springgreen'
          else
              @message = "Too low"
              @background = 'yellow'          
          end
          else
              @message = "You got it right"
              @background = 'green'
              won?	      
          end        
          

        @guesses -= 1
        puts "You have #{@guesses} guesses left"
        puts "#{@secret_number}"
      

      
  end

 def won?
   @message == "You got it right"	 
 end
  
 
end
