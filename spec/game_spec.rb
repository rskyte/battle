require 'game'

describe Game do
  subject(:game) { described_class.new }
  let(:player1) { double(:my_p1) }

  it 'facilitates players attacking each other' do
    expect(player1).to receive(:reduce_hp).with Game::DEFAULT_DAMAGE
    game.attack(player1)
  end

end
