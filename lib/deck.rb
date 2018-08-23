require 'pry'
require './lib/cards'

class Deck
  attr_reader :playing_cards

  def initialize(playing_cards)
    @playing_cards = playing_cards

  end

  def cards
    playing_cards.each do |cards|
      cards
    end
  end

  def count
    c = 0
    playing_cards.each do |num|
      c += 1
    end
    c
  end

  def sort(deck)
    card_value = [2, 3, 4, 5, 6, 7, 8, 9, "Jack", "Queen", "King", "Ace"]
    return deck if deck.count <= 1
    swap = true
      while swap
        swap = false
        (deck.count - 1).times do |x|
          if card_value.index(x) > card_value.index(x + 1)
            card_value.index(x), card_value.index(x + 1) = card_value.index(x + 1), card_value.index(x)
            swap = true
          end
        end
      end
    deck
  end
end
# binding.pry
