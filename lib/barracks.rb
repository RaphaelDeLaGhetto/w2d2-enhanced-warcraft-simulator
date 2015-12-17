class Barracks
  attr_accessor :food, :gold

  def initialize
    @food = 80
    @gold = 1000
  end

  def can_train_footman?
    return true if self.food >= 2 && self.gold >= 135
    false
  end

  def train_footman
    return if !can_train_footman?
    @gold -= 135
    @food -= 2
    Footman.new
  end

  def can_train_peasant?
    return true if self.food >= 5 && self.gold >= 90
    false
  end

  def train_peasant
    return if !can_train_peasant?
    @gold -= 90
    @food -= 5
    Peasant.new
  end
end
