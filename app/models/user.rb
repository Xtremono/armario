class User < ApplicationRecord
  has_many :clothes, dependent: :destroy # el vendedor
  has_many :orders, dependent: :destroy # el comprador, si se borra el usuario se destruyen las prendas
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
end
