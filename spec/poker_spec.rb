require 'rspec'
require 'poker'


describe "Game" do


end

describe "Deck" do
  let(:deck) { Deck.new }

  describe "#new" do
    it "returns a new deck object" do
      expect(deck).to be_an_instance_of(Deck)
    end

    it "returns 52 cards with value in 1..13" do
      expect(deck.cards.length).to eq(52)
      deck.cards.each do |card|
        expect(card.value).to be_between(0,14)
      end
    end

  end

  describe "#deal" do
    it "deck no longer contains the dealt cards" do
      cards = deck.deal(5)
      expect(deck.cards).not_to include(cards)
    end
  end

end

describe "Card" do

  let(:card) do
    Card.new(:hearts, 12)
  end

  describe "#new" do
    it "returns a new card object" do
      expect(card).to be_an_instance_of(Card)
    end
  end

  describe "#suit" do
    it "returns the suit" do
      expect(card.suit).to eq(:hearts)
    end

  end

  describe "#value" do
    it "returns a value" do
      expect(card.value).to eq(12)
    end

  end

  describe "#to_s" do
    it "prints a suit and a value" do
      expect(card.to_s).to eq("Q of Hearts")
    end

  end

end

describe "Hand" do

  let(:deck) do
    d = double("deck")
  end

  let(:hand) do
    hand = Hand.new
  end

  describe "#straight_flush?" do
    it "returns true when its a straight flush"
    it "returns false when its not a straight flush"
    expect([])

  end
  describe "#four_of_a_kind?" do
    it "returns true when its a four of a kind"
    it "returns false when its not a four of a kind"
  end


  describe "#full_house?" do
    it "returns true when its a full house"
    it "returns false when its not a full house"
  end

  describe "#flush?" do
    it "returns true when its a flush"
    it "returns false when its not a flush"
  end


  describe "#straight?" do
    it "returns true when its a straight"
    it "returns false when its not a straight"
  end

  describe "#three_of_a_kind?" do
    it "returns true when its a three of a kind"
    it "returns false when its not a three of a kind"
  end


  describe "#two_pair?" do
    it "returns true when its a two pair"
    it "returns false when its not a two pair"
  end

  describe "#one_pair?" do
    it "returns true when its a one pair"
    it "returns false when its not a one pair"
  end

  describe "#high_card?" do
    it "returns true when its a high card"
    it "returns false when its not a high card"
  end

end





















