
feature 'hitpoints' do

  scenario 'Will show player hitpoints' do
    sign_in_and_play
    expect(page).to have_content "Jeff HP: 60"
    expect(page).to have_content "Jim HP: 60"
  end

end
