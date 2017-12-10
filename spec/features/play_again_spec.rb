feature 'restarting after game over' do

  scenario 'can start a new game by clicking a button' do
    sign_in_and_play
    sim_battle
    click_button 'Play Again?'
    expect(page).to have_current_path '/'
  end

end
