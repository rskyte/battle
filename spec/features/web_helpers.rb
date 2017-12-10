def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: "Jeff"
  fill_in :player_2_name, with: "Jim"
  click_button "Submit"
end

def sim_battle
  5.times do
    click_button(@button_id = 'first')
    click_button(@button_id = 'second')
  end
  click_button(@button_id = 'first')
end
