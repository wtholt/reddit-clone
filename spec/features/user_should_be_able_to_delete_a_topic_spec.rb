require 'rails_helper'

feature 'User should be able to delete a topic' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user: user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit root_path

    click_link 'Delete Topic'

    expect(page).not_to have_css 'a', text: "#{topic.name}"
  end
end
