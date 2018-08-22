require 'minitest/autorun'
require 'minitest/pride'
require './lib/round'
require './lib/guess'

class RoundTest < Minitest::Test
  def test_returns_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
  end

  def test_returns_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal [], round.guesses
  end

  def test_returns_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
    round.record_guess({value: "3", suit: "Hearts"})
    round.guesses.first.feedback
    assert_equal card_2, round.current_card
  end

  def test_returns_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("3 of Hearts", card_1)
    assert_instance_of Guess, round.record_guess({value: "3", suit: "Hearts"})
    assert_instance_of Guess, round.record_guess({value: "Jack", suit: "Diamonds"})
  end

  def test_is_count_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("3 of Hearts", card_1)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.guesses.count
    round.record_guess({value: "7", suit: "Clubs"})
    assert_equal 2, round.guesses.count
  end

  def test_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("3 of Hearts", card_1)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal "Correct!", round.guesses.first.feedback
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal "Incorrect!", round.guesses.last.feedback
  end

  def test_num_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("3 of Hearts", card_1)
    round.record_guess({value: "3", suit: "Hearts"})
    assert_equal 1, round.number_correct
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, round.number_correct
  end
end
