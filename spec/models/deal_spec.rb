require 'rails_helper'

RSpec.describe Deal, type: :model do
  it 'is valid with valid attributes' do
    deal = Deal.new(
      name: 'Deal Name',
      amount: 10,
      author: FactoryBot.create(:user)
    )
    expect(deal).to be_valid
  end

  it 'is not valid without a name' do
    deal = Deal.new(
      amount: 10,
      author: FactoryBot.create(:user)
    )
    expect(deal).to_not be_valid
  end

  it 'is not valid without an amount' do
    deal = Deal.new(
      name: 'Deal Name',
      author: FactoryBot.create(:user)
    )
    expect(deal).to_not be_valid
  end

  it 'is not valid without a user' do
    deal = Deal.new(
      name: 'Deal Name',
      amount: 10
    )
    expect(deal).to_not be_valid
  end
end
