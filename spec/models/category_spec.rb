require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    category = Category.new(
      name: 'Category Name',
      icon: 'Category Icon',
      user: FactoryBot.create(:user)
    )
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(
      icon: 'Category Icon',
      user: FactoryBot.create(:user)
    )
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(
      name: 'Category Name',
      user: FactoryBot.create(:user)
    )
    expect(category).to_not be_valid
  end

  it 'is not valid without a user' do
    category = Category.new(
      name: 'Category Name',
      icon: 'Category Icon'
    )
    expect(category).to_not be_valid
  end
end
