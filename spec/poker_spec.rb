require 'rspec'
require 'poker'


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




  describe "#straight_flush?" do

    it "returns true when its a straight flush" do

        cards = [double("card", :value => 1, :suit => :clubs), \
                 double("card", :value => 13, :suit => :clubs), \
                 double("card", :value => 12, :suit => :clubs), \
                 double("card", :value => 11, :suit => :clubs), \
                 double("card", :value => 10, :suit => :clubs)]
        hand = Hand.new(cards)
        expect(hand.straight_flush?).to be_true
    end

    it "returns false when its not a straight flush" do

        cards = [double("card", :value => 1, :suit => :clubs), \
                 double("card", :value => 2, :suit => :clubs), \
                 double("card", :value => 12, :suit => :clubs), \
                 double("card", :value => 11, :suit => :clubs), \
                 double("card", :value => 10, :suit => :clubs)]
        hand = Hand.new(cards)
        expect(hand.straight_flush?).to be_false
    end
 end


  describe "#four_of_a_kind?" do
    it "returns true when its a four of a kind" do

        cards = [double("card", :value => 4, :suit => :clubs), \
                 double("card", :value => 4, :suit => :hearts), \
                 double("card", :value => 4, :suit => :spades), \
                 double("card", :value => 4, :suit => :diamonds), \
                 double("card", :value => 10, :suit => :clubs)]
        hand = Hand.new(cards)
        expect(hand.four_of_a_kind?).to be_true
    end
    it "returns false when its not a four of a kind" do

        cards = [double("card", :value => 3, :suit => :clubs), \
                 double("card", :value => 4, :suit => :hearts), \
                 double("card", :value => 4, :suit => :spades), \
                 double("card", :value => 4, :suit => :diamonds), \
                 double("card", :value => 10, :suit => :clubs)]
      hand =   Hand.new(cards)
        expect(hand.four_of_a_kind?).to be_false
    end
  end


  describe "#full_house?" do
    it "returns true when its a full house" do

        cards = [double("card", :value => 4, :suit => :clubs), \
                 double("card", :value => 4, :suit => :hearts), \
                 double("card", :value => 4, :suit => :spades), \
                 double("card", :value => 10, :suit => :diamonds), \
                 double("card", :value => 10, :suit => :clubs)]
        hand = Hand.new(cards)
        expect(hand.full_house?).to be_true
    end
    it "returns false when its not a full house" do

        cards = [double("card", :value => 3, :suit => :clubs), \
                 double("card", :value => 4, :suit => :hearts), \
                 double("card", :value => 4, :suit => :spades), \
                 double("card", :value => 10, :suit => :diamonds), \
                 double("card", :value => 10, :suit => :clubs)]
        hand = Hand.new(cards)
        expect(hand.full_house?).to be_false
    end
  end

  describe "#flush?" do
    it "returns true when its a flush" do

        cards = [double("card", :value => 1, :suit => :clubs), \
                 double("card", :value => 3, :suit => :clubs), \
                 double("card", :value => 4, :suit => :clubs), \
                 double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 5, :suit => :clubs)]
        hand = Hand.new(cards)
        expect(hand.flush?).to be_true
    end
    it "returns false when its not a flush" do

        cards = [double("card", :value => 1, :suit => :clubs), \
                 double("card", :value => 3, :suit => :clubs), \
                 double("card", :value => 4, :suit => :spades), \
                 double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 5, :suit => :clubs)]
      hand =   Hand.new(cards)
        expect(hand.flush?).to be_false
    end
  end


  describe "#straight?" do
    it "returns true when its a straight" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 8, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 6, :suit => :clubs), \
                 double("card", :value => 5, :suit => :clubs)]
        hand = Hand.new(cards)
        expect(hand.straight?).to be_true
    end
    it "returns false when its not a straight" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 1, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 6, :suit => :clubs), \
                 double("card", :value => 5, :suit => :clubs)]
      hand =   Hand.new(cards)
        expect(hand.straight?).to be_false
    end
  end

  describe "#three_of_a_kind?" do
    it "returns true when its a three of a kind" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 9, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 9, :suit => :diamonds), \
                 double("card", :value => 8, :suit => :spades)]
        hand = Hand.new(cards)
        expect(hand.three_of_a_kind?).to be_true
    end
    it "returns false when its not a three of a kind" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 8, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 9, :suit => :diamonds), \
                 double("card", :value => 8, :suit => :spades)]
        hand = Hand.new(cards)
        expect(hand.three_of_a_kind?).to be_false
    end
  end


  describe "#two_pair?" do
    it "returns true when its a two pair" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 9, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 7, :suit => :diamonds), \
                 double("card", :value => 8, :suit => :spades)]
        hand = Hand.new(cards)
        expect(hand.two_pair?).to be_true
    end
    it "returns false when its not a two pair" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 9, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 6, :suit => :diamonds), \
                 double("card", :value => 8, :suit => :spades)]
        hand = Hand.new(cards)
        expect(hand.two_pair?).to be_false
    end
  end

  describe "#one_pair?" do
    it "returns true when its a one pair" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 9, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 6, :suit => :diamonds), \
                 double("card", :value => 8, :suit => :spades)]
        hand = Hand.new(cards)
        expect(hand.one_pair?).to be_true
    end
    it "returns false when its not a one pair" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 12, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 6, :suit => :diamonds), \
                 double("card", :value => 8, :suit => :spades)]
      hand =   Hand.new(cards)
        expect(hand.one_pair?).to be_false
    end
  end

  describe "#high_card?" do
    it "returns true when its a high card" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 12, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 6, :suit => :diamonds), \
                 double("card", :value => 8, :suit => :spades)]
      hand =   Hand.new(cards)
        expect(hand.high_card?).to be_true
    end
    it "returns false when its not a high card" do

        cards = [double("card", :value => 9, :suit => :clubs), \
                 double("card", :value => 12, :suit => :hearts), \
                 double("card", :value => 7, :suit => :spades), \
                 double("card", :value => 6, :suit => :diamonds), \
                 double("card", :value => 12, :suit => :spades)]
      hand =   Hand.new(cards)
        expect(hand.high_card?).to be_false
    end
  end

  describe "#winning_hand" do
    it "returns true when straight flush beats four of a kind"
  end
end






















