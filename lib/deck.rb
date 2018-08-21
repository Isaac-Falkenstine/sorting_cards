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
end
