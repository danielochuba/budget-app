require 'rails_helper'

RSpec.describe 'Please Customize the email and password with yours: categories/index', type: :feature do
  describe 'index page' do
    let(:user) { User.create(id: 1, name: 'Daniel Ochuba', email: 'danielochuba78@gmail.com', password: 'Welcome126@') }

    let(:category) do
      Category.create(id: 1, name: 'Sample Category', icon: 'Sample Icon',
                      user_id: user.id)
    end
    before do
      visit root_path
    end

    it 'renders the index view' do
      expect(page).to have_content('Log In')
    end
  end
end
