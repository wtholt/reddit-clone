require 'rails_helper'

feature 'User should only see posts to that topic' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user_id: user, name: 'topic1')
    other_topic = create(:topic, user_id: user, name: 'topic2')
    post = create(:post, user: user, topic: topic, title: 'ooga booga')
    post_two = create(:post, user: user, topic: other_topic, title: 'bob')
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit root_path

    click_link "#{topic.name}"

    expect(page).to have_content post.title
    expect(page).not_to have_content post_two.title
  end
end
