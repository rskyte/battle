feature 'attacking' do

  scenario 'player 1 can launch an attack and receive a confirmation' do
    sign_in_and_play
    click_button(@button_id = "first")
    expect(page).to have_content 'Jeff has attacked Jim!'
  end

  scenario 'player 2 can launch an attack and receive a confirmation' do
    sign_in_and_play
    click_button(@button_id = "first")
    click_button(@button_id = "second")
    expect(page).to have_content 'Jim has attacked Jeff!'
  end

  scenario 'reduces p2 hitpoints by 10 when p1 attacks' do
    sign_in_and_play
    click_button(@button_id = "first")
    expect(page).to have_content 'Jim HP: 50'
  end

  scenario 'reduces p1 hitpoints by 10 when p2 attacks' do
    sign_in_and_play
    click_button(@button_id = "first")
    click_button(@button_id = "second")
    expect(page).to have_content 'Jeff HP: 50'
  end

end
