class Check < ApplicationRecord
  validates :goal, length: { maximum: 50 }
  belongs_to :user
end
