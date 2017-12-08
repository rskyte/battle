feature 'ending a game' do

  scenario "when a player's HP reaches zero the lose the game" do
    sign_in_and_play
    5.times do
      click_button(@button_id = 'first')
      click_button(@button_id = 'second')
    end
    click_button(@button_id = 'first')
    expect(page).to have_content 'Jim Loses!'
  end

end
