require_relative 'spec_helper'

# Enhancement 1 continued...
#
# In most strategy games, like Warcraft III, buildings can also be attacked by
# units. Since a barracks is a building, it has substantial more HP (500) To 
# make matters worse, a Footman does only HALF of its AP as damage to a
# Barracks. This is because they are quite ineffective against buildings.

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "does half damage to a Barracks" do
      enemy_barracks = Barracks.new
      expect(enemy_barracks).to receive(:damage).with((@footman.attack_power/2.0).ceil)
      @footman.attack!(enemy_barracks)
    end
  end
end
