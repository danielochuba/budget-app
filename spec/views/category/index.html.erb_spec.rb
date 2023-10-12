require 'rails_helper'

RSpec.describe 'Please Customize the email and password with yours: categories/index', type: :feature do
  describe 'index page' do
    let(:user) { User.create(id: 1, name: 'Daniel Ochuba', email: 'danielochuba78@gmail.com', password: 'Welcome126@') }

    let(:category) do
      Category.create(id: 1, name: 'Sample Category', icon: 'Sample Icon'	,
                    user_id: user.id)
    end
    before do
      visit root_path

      # Click the 'Sign in' link
      click_link 'Sign In'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      # Click the sign-in button (adjust the selector based on your UI)
      click_button 'Log in'
    end

    it 'renders the index view' do
      expect(page).to have_content('ADD CATEGORY')
    end
  end
end
