require 'rails_helper'

feature 'User should view post' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user_id: user)
    post = create(:post, user_id: user, topic: topic)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit topic_path(topic)

    click_link "#{post.title}"

    expect(page).to have_css 'h1', text: "#{post.title}"
    expect(page).to have_css 'p', text: "#{post.content}"
  end
end
