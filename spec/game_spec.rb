require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  let(:player1) { double(:my_p1) }
  let(:player2) { double(:my_p2, reduce_hp: true) }

  it "retrieves the first player" do
    expect(game.player1).to eq player1
  end

  it "retrieves the first player" do
    expect(game.player2).to eq player2
  end

  it 'facilitates players attacking each other' do
    expect(game.player1).to receive(:reduce_hp).with Game::DEFAULT_DAMAGE
    game.attack(player1)
  end

  it 'has an accessible turn attribute' do
    expect(game.turn).to eq 'p1'
  end

  it 'changes the value turn after attacking' do
    expect { game.attack(player2) }.to change { game.turn }.to 'p2'
  end

end
