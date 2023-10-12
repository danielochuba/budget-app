# spec/controllers/categories_controller_spec.rb

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { FactoryBot.create(:user) } # Assuming you have a User model
  let(:valid_attributes) { { name: 'Test Category', icon: 'test.png', user_id: user.id } }
  let(:invalid_attributes) { { name: '', icon: 'test.png', user_id: user.id } }
  let(:category) { FactoryBot.create(:category, valid_attributes) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: category.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: category.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        expect do
          post :create, params: { category: valid_attributes }
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the categories index' do
        post :create, params: { category: valid_attributes }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        expect do
          post :create, params: { category: invalid_attributes }
        end.to change(Category, :count).by(0)
      end

      it 'returns a success response (unprocessable_entity)' do
        post :create, params: { category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested category' do
        new_name = 'Updated Category'
        patch :update, params: { id: category.to_param, category: { name: new_name } }
        category.reload
        expect(category.name).to eq(new_name)
      end

      it 'redirects to the categories index' do
        patch :update, params: { id: category.to_param, category: valid_attributes }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid parameters' do
      it 'returns a success response (unprocessable_entity)' do
        patch :update, params: { id: category.to_param, category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested category' do
      category # Create the category
      expect do
        delete :destroy, params: { id: category.to_param }
      end.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      delete :destroy, params: { id: category.to_param }
      expect(response).to redirect_to(categories_url)
    end
  end
end
