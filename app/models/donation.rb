class Donation < ApplicationRecord
  attr_accessor :token
  belongs_to :user
  validates :payment_day, presence: true
  validates :token,       presence: true
end
