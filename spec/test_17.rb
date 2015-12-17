require_relative 'spec_helper'

# Enhancement 5 continued...
#
# Introduce a SiegeEngine Unit. The SiegeEngine is very effective against
# buildings such as the Barracks. It is however ineffective against other units
# (can't attack them, as though they were dead).
#
# So unlike with Footman (whose attacks do a fraction of the damage they
# normally would), the SiegeEngine does 2x the damage against the Barracks
#
# Also, Siege Engines can attack other siege engines even though they cannot
# attack any other units (such as Peasants or Footmen)
#
# Stats:
#
# AP: 50
# HP: 400
# Cost: 200 gold, 60 lumber, 3 food

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#can_build_siege_engine?" do
    it "returns true if there are enough resources to build a siege engine" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple footmen
      expect(@barracks.can_build_siege_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 1 food item left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 134 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(134)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barracks believe it only has 134 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      expect(@barracks).to receive(:gold).and_return(134)
      expect(@barracks.can_build_siege_engine?).to be_falsey
    end
  end

  describe "#build_siege_engine" do
    it "does not build a siege engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(false)
      expect(@barracks.build_siege_engine).to be_nil
    end

    it "builds a siege engine if there are enough resources" do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(true)
      expect(@barracks.build_siege_engine).to be_a(SiegeEngine)
    end

    it "deducts resources consumed" do
      expect(@barracks).to receive(:can_build_siege_engine?).and_return(true)
      @barracks.build_siege_engine
      expect(@barracks.food).to eq(77)
      expect(@barracks.gold).to eq(800)
      expect(@barracks.lumber).to eq(440)
    end
  end
end
