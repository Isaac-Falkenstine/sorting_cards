require './lib/cards'
require 'pry'

class Guess
  attr_reader :card,
              :guess

  def initialize(guess, card)
    @card = card
    @guess = guess
  end

  def responce
    guess
  end

  def correct?
    if guess == card.value + " of " + card.suit
      return true
    else
      return false
    end
  end

  def feedback
    if guess == card.value + " of " + card.suit
      puts "Correct!"
    else
      puts "Incorrect!"
    end
  end
end
