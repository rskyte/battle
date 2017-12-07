feature 'entering names' do

  scenario 'Will use a form to ask for a player name and display on screen' do
    sign_in_and_play
    expect(page).to have_content "Jeff vs Jim Let's battle!!!"
  end

end
