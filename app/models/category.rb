class Category < ApplicationRecord

  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :user
end
