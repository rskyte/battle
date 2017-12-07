class Player
  attr_accessor :hp
  attr_reader :name

  def initialize(name, hp=Battle::STARTING_HP)
    @name = name
    @hp = hp
  end

  def reduce_hp(num)
    @hp -= num
  end

end
