require './lib/deck'
require './lib/guess'
require 'pry'

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
      @deck = deck
      @guesses = []
  end

  def current_card
    deck.playing_cards[@guesses.length]
  end

  def record_guess(hash)
    card = deck.playing_cards[@guesses.length]
    guess_1 = "#{hash[:value]} of #{hash[:suit]}"
    new_guess = Guess.new(guess_1, card)
    @guesses << new_guess
    new_guess
  end

  def feedback
    if round.guesses(guess) == round.card
      "Correct!"
    else
      "Incorrect!"
    end
  end

  def number_correct
    correct = @guesses.find_all {|guess| guess.correct?}
    correct.length
  end



end
 # binding.pry
