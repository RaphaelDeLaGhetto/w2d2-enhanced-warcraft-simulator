require_relative 'spec_helper'

# Enhancement 5
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

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  describe "#initialize" do
    it "starts off with 400 health_points" do
      expect(@siege_engine.health_points).to eq(400)
    end
  
    it "start off with 50 attack_power" do
      expect(@siege_engine.attack_power).to eq(50)
    end
  end

  describe "#attack!" do
    it "does 2x damage against Barracks" do
      enemy = Barracks.new
      expect(enemy).to receive(:damage).with(100)
      @siege_engine.attack!(enemy)
    end

    it "does damage against other SiegeEngines" do
      enemy = SiegeEngine.new
      expect(enemy).to receive(:damage).with(50)
      @siege_engine.attack!(enemy)
    end

    it "does no damage to Footmen" do
      enemy = Footman.new
      expect(enemy.health_points).to eq(60)
      @siege_engine.attack!(enemy)
      expect(enemy.health_points).to eq(60)
    end

    it "does no damage to Peasants" do
      enemy = Peasant.new
      expect(enemy.health_points).to eq(35)
      @siege_engine.attack!(enemy)
      expect(enemy.health_points).to eq(35)
    end
  end
end
