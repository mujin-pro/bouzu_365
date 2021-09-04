class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :mission, length: { maximum: 50 }
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }, allow_blank: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :checks
  has_many :completes
  has_many :donations
end
