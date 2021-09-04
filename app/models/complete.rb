class Complete < ApplicationRecord
  validates :activity, length: { maximum: 50 }
  belongs_to :user
end
