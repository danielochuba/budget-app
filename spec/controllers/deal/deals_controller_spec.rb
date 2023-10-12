require 'rails_helper'

RSpec.describe DealsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user: user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { category_id: category.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { category_id: category.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'creates a new deal' do
      deal_params = { name: 'New Deal', amount: 10, author_id: user.id, category_ids: [category.id] }
      expect {
        post :create, params: { category_id: category.id, deal: deal_params }
      }.to change(Deal, :count).by(1)
      expect(response).to redirect_to(category_deals_path(category))
    end

    it 'does not create a deal with invalid parameters' do
      deal_params = { name: '', amount: 10, author_id: user.id, category_ids: [category.id] }
      expect {
        post :create, params: { category_id: category.id, deal: deal_params }
      }.to change(Deal, :count).by(0)
      expect(response).to have_http_status(422)
    end
  end
end
