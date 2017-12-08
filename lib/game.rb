require_relative 'player'

class Game
  STARTING_HP = 60
  DEFAULT_DAMAGE = 10

  attr_accessor :player1, :player2
  attr_reader :turn

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 'p1'
  end

  def attack(player)
    player.reduce_hp(DEFAULT_DAMAGE)
    change_turn
  end

  def change_turn
    @turn == 'p1' ? @turn = 'p2' : @turn = 'p1'
  end

end
