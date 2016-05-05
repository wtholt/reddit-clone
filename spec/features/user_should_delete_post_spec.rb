require 'rails_helper'

feature 'User should delete post' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user: user)
    post = create(:post, user: user, topic: topic)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit topic_path(topic)

    click_link 'Delete Post'

    expect(page).not_to have_css 'a', text: "#{post.content}"
  end
end
