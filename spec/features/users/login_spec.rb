
require 'rails_helper'

RSpec.describe 'login page' do
  it 'logs in and take you to the dashboard' do
    user = User.create!(name: 'Drew', email: 'drewdrew@drew.com', password: 'drew')
    visit '/login'
    fill_in 'Email', with: "drewdrew@drew.com"
    fill_in 'Password', with: "drew"
    click_button("Login")
    expect(current_path).to eq(user_dashboard_path(user))

  end

  context 'sad path' do
    it 'redirects to login form if user fails to enter correct credentials' do
      user = User.create!(name: 'Drew', email: 'drewdrew@drew.com', password: 'drew')
      visit '/login'

      fill_in 'Email', with: "drewdrew@drew.com"
      fill_in 'Password', with: "snozberry"
      click_button("Login")

      expect(current_path).to eq('/login')
      within '.flash' do
        expect(page).to have_content('Invalid email/password')
      end
    end
  end
end
