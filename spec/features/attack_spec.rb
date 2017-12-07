feature 'attacking' do

  scenario 'player 1 can launch an attack and receive a confirmation' do
    sign_in_and_play
    click_button(@button_id = "first")
    expect(page).to have_content 'Jeff has attacked Jim!'
  end

  scenario 'player 2 can launch an attack and receive a confirmation' do
    sign_in_and_play
    click_button(@button_id = "second")
    expect(page).to have_content 'Jim has attacked Jeff!'
  end

  scenario 'reduces p2 hitpoints by 10 when p1 attacks' do
    sign_in_and_play
    expect { click_button(@button_id = "first") }.to change { $game.player2.hp }.by (-10)
  end

  scenario 'reduces p1 hitpoints by 10 when p2 attacks' do
    sign_in_and_play
    expect { click_button(@button_id = "second") }.to change { $game.player1.hp }.by (-10)
  end

end
