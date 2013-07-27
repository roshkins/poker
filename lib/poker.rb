class Card

  attr_reader :suit, :value

  def initialize(suit, number)
    @suit = suit
    @value = number
  end

  VALUES = ["A", "J", "Q", "K"]

  def to_s
    num_str = \
    case @value
    when 1
      VALUES[0]
    when 11
      VALUES[1]
    when 12
      VALUES[2]
    when 13
      VALUES[3]
    else
      @value.to_s
    end
    "#{num_str} of #{@suit.to_s.capitalize}"
  end

end

class Deck
  attr_reader :cards

  SUITS = [:clubs, :hearts, :spades, :diamonds]

  def initialize
    @cards = []

    13.times do |value|
      4.times do |suit|
        @cards << Card.new(SUITS[suit], value + 1)
      end
    end
  end

  def deal(num_of_cards = 1)
    return_cards = @cards.sample(num_of_cards)
    @cards -= return_cards
    return_cards
  end


end