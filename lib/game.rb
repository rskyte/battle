require_relative 'player'

class Game
  STARTING_HP = 60
  DEFAULT_DAMAGE = 10

  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def attack(player)
    player.reduce_hp(DEFAULT_DAMAGE)
  end

end
