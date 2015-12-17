require_relative 'spec_helper'

# Enhancement 1
#
# In most strategy games, like Warcraft III, buildings can also be attacked by
# units. Since a barracks is a building, it has substantial more HP (500) To 
# make matters worse, a Footman does only HALF of its AP as damage to a
# Barracks. This is because they are quite ineffective against buildings.

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "is a Unit" do
    expect(@barracks).to be_an_instance_of(Barracks)
    expect(@barracks).to be_a(Unit)
  end
end
