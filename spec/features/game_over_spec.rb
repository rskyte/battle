feature 'ending a game' do

  scenario "when a player's HP reaches zero the lose the game" do
    sign_in_and_play
    sim_battle
    expect(page).to have_content 'Jim Loses!'
  end

end
