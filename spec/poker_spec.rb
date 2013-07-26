require 'rspec'
require 'poker'


namespace "Game" do


end

namespace "Card" do

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

  describe "#number" do
    it "returns a number" do
      expect(card.number).to eq(12)
    end

  end

  describe "#to_s" do
    it "prints a suit and a number" do
      expect(card.to_s).to eq("queen of hearts")
    end

  end

end

