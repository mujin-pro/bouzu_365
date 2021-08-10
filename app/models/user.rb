class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  validates :mission, length: { maximum: 50 }
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }, allow_blank: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
