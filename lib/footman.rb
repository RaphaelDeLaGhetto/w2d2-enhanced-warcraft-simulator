# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit
  def initialize
    super(60, 10)
  end

  def attack!(enemy)
    enemy.damage(enemy.is_a?(Barracks) ? (@attack_power/2.0).ceil : @attack_power)
  end
end
