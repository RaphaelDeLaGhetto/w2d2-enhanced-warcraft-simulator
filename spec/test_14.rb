require_relative 'spec_helper'

# Enhancement 3
#
# A dead unit cannot attack another unit. Conversely, an alive unit will also
# not attack another unit that is already dead. 

describe Unit do

  before :each do
    @alive = Unit.new(100, 10)
    @dead = Unit.new(0, 10)
  end

  describe "#attack!" do
    it "does no damage when a dead unit attacks a living unit" do
      expect(@alive.health_points).to eq(100)
      @dead.attack!(@alive)
      expect(@alive.health_points).to eq(100)
    end

    it "does no damage when a living unit attacks a dead unit" do
      expect(@dead.health_points).to eq(0)
      @alive.attack!(@dead)
      expect(@dead.health_points).to eq(0)
    end
  end
end
