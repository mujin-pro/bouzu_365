class Check < ApplicationRecord
  validates :activities, length: { maximum: 50 }
  belongs_to :user
end
