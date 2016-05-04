require 'rails_helper'

feature 'User should be able to sign in' do
  scenario 'successfully' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end
end
