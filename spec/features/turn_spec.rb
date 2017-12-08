feature 'turns' do

  scenario 'current player turn is displayed' do
    sign_in_and_play
    expect(page).to have_content 'Jeff! Your turn!'
  end

  scenario 'an action (attacking) will change the current turn displayed' do
    sign_in_and_play
    click_button(@button_id = 'first')
    expect(page).to have_content 'Jim! Your turn!'
  end

end
