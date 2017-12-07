require 'player'

describe Player do
  subject(:player) { described_class.new('Lan') }

  it 'stores an accessible name' do
    expect(player.name).to eq 'Lan'
  end

  it 'stores an accessible hp value' do
    expect(player.hp).to eq 60
  end
end
