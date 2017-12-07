require 'player'

describe Player do
  subject(:player) { described_class.new('Lan') }

  it 'stores an accessible name' do
    expect(player.name).to eq 'Lan'
  end
  
end
