require 'rails_helper'

feature 'User should edit topic' do
  scenario 'successfully' do
    user = create(:user)
    topic = create(:topic, user_id: user)
    post = create(:post)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    visit topic_path(topic)

    click_link 'Create Post'

    fill_in 'post_title', with: 'interesting title'
    fill_in 'post_content', with: 'interesting post'
    click_button 'Create Post'

    expect(page).to have_css 'a', text: 'interesting title'
    expect(page).not_to have_css 'a', text: "#{post.content}"
  end
end
