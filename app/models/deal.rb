class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  #  has_and_belongs_to_many :categories, through: :categories_deals

  has_many :category_deals, dependent: :destroy
  has_many :categories, through: :category_deals
end
