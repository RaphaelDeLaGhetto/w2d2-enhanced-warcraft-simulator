require_relative 'spec_helper'

# Enhancement 2
#
# Units start off alive but they die if their HP hits 0 or lower. This is
# usually a result of receiving damage from combat

describe Unit do

  before :each do
    @unit = Unit.new(100, 10)
  end

  describe "#dead?" do
    it "returns true if it has 0 health_points" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to eq(true)
    end

    it "returns false if it has more than 0 health_points" do
      expect(@unit.dead?).to eq(false)
    end
  end
end
