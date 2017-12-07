feature 'attacking' do
  scenario 'can launch an attack and receive a confirmation' do
    sign_in_and_play
    click_on 'Attack P1'
    expect(page).to have_content 'Player 1 has attacked Player 2!'
    # click_on 'Attack P2'
    # expect(page).to have_content 'Player 2 has attacked Player 1!'
  end
end
