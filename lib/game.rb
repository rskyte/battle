require_relative 'player'

class Game
  STARTING_HP = 60
  DEFAULT_DAMAGE = 10

  def attack(player)
    player.reduce_hp(DEFAULT_DAMAGE)
  end

end
