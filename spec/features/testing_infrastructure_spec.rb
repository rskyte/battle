
feature 'Testing infrastructure' do

  scenario 'Will use a form to ask for a player name and display on screen' do
    visit('/')
    fill_in :player_1_name, with: "Jeff"
    fill_in :player_2_name, with: "Jim"
    click_button "Submit"
    expect(page).to have_content "Player 1 Name: Jeff! Player 2 Name: Jim! Let's battle!!!"
  end

  scenario 'Will show player hitpoints' do
    visit('/')
    fill_in :player_1_name, with: "Jeff"
    fill_in :player_2_name, with: "Jim"
    click_button "Submit"
    #click_button "Play"
    expect(page).to have_content "Jeff HP: 60 Jim HP: 60"
  end
end
