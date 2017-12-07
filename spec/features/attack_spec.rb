feature 'attacking' do

  scenario 'can launch an attack and receive a confirmation' do
    sign_in_and_play
    click_on 'Attack P1'
    expect(page).to have_content 'Jeff has attacked Jim!'
  end

  scenario 'can launch an attack and receive a confirmation' do
    sign_in_and_play
    click_on 'Attack P1'
    expect(page).to have_content 'Jeff has attacked Jim!'
  end

  scenario 'reduces p2 hitpoints by 10 when p1 attacks' do
    sign_in_and_play
    expect { click_on 'Attack P1' }.to change { $player2.hp }.by -10
  end

  scenario 'reduces p1 hitpoints by 10 when p2 attacks' do
    sign_in_and_play
    expect { click_on 'Attack P2' }.to change { $player1.hp }.by -10
  end

end
