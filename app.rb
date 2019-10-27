require 'sinatra'
require 'sinatra/reloader'
require_relative 'web_guesser.rb'

set :bind, '167.71.189.199'
guesser_game = NumGuess.new
link = '<a href="/">Play Again?</a>'

get '/' do
  background = 'white'	
  erb :index, :locals => { :background => background }
end

post '/result' do
 # throw params.inspect 
	guess = params["guess"].to_i
	secret_number = guesser_game.secret_number
        if guesser_game.guesses == 0
          message = "You are out of guesses"		
	  guesser_game = NumGuess.new
	  link = link	  
        else	  
	  guesser_game.check(guess)
	  message = guesser_game.message
	  background = guesser_game.background
	  if guesser_game.won?
		  guesser_game = NumGuess.new
	  end
      end
  erb :result, :locals => { :message => message, :link => link, :background => background }
  
end

