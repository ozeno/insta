class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pic
  validates :body, presence: true, length: { minimum: 5 }
end
