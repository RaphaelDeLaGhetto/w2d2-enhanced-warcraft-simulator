class Unit
  attr_reader :health_points, :attack_power

  def initialize(hp, ap)
    @health_points = hp
    @attack_power = ap
  end

  def attack!(enemy)
    enemy.damage(@attack_power) if !enemy.dead? && !self.dead?
  end

  def damage(dmg)
    @health_points -= dmg
  end

  def dead?
    self.health_points < 1
  end
end
