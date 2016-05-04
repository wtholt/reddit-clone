require 'rails_helper'

feature 'User should view Topic' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user: user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit root_path

    click_link "#{topic.name}"

    expect(page).to have_css 'h1', text: 'Posts'
  end
end
