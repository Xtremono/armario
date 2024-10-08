class Clothe < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :size, presence: true
  validates :price, presence: true
  validates :name, presence: true
  validates :brand, presence: true
end
