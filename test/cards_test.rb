require 'minitest/autorun'
require 'minitest/pride'
require './lib/cards'

class CardsTest < Minitest::Test
  def test_its_value
    cards = Card.new("Ace", "Spades")
    assert_equal "Ace", cards.value
  end
  def test_its_suit
    cards = Card.new("Ace", "Spades")
    assert_equal "Spades", cards.suit
  end
end
