class Clothe < ApplicationRecord
  belongs_to :user

  validates :size, presence: true
  validates :price, presence: true
  validates :name, presence: true
  validates :brand, presence: true

end
