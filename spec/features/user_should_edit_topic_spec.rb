require 'rails_helper'

feature 'User should edit topic' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user_id: user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit root_path

    click_link 'Edit Topic'

    fill_in 'topic_name', with: 'interesting topic'
    click_button 'Update Topic'

    expect(page).to have_css 'a', text: 'interesting topic'
  end
end
