require 'rails_helper'

feature 'User should visit root page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css 'h1', text: 'Reddit Clone'
  end
end
