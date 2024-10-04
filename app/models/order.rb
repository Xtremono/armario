class Order < ApplicationRecord
  belongs_to :user
  belongs_to :clothe

  validates :price, presence: true
  validates :order_date, presence: true
end
