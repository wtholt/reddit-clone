require 'rails_helper'

feature 'User should create a thread' do
  scenario 'successfully' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit root_path

    click_link 'Create a Topic'

    fill_in 'topic_name', with: 'ooga booga'
    click_button 'Create Topic'

    expect(page).to have_css 'a', text: 'ooga booga'
  end
end
