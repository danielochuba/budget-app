class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :user
  #  has_and_belongs_to_many :deals, through: :categories_deals
  has_many :category_deals
  has_many :deals, through: :category_deals
end
