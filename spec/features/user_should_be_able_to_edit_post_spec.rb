require 'rails_helper'

feature 'User should edit topic' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user: user)
    post = create(:post,
                  title: 'content',
                  content: 'content',
                  topic: topic,
                  user: user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit topic_path(topic)

    click_link 'Edit Post'

    fill_in 'post_title', with: 'content title'
    fill_in 'post_content', with: 'content is cool'
    click_button 'Update Post'

    expect(page).to have_css 'a', text: 'content title'
  end
end
