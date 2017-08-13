class Pic < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/, presence: true
  validates_attachment_presence :image
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  has_many :comments, dependent: :destroy
end
