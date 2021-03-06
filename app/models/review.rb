class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :content_body, minimum: 50
  validates_length_of :content_body, maximum: 250
  validates_length_of :rating, minimum: 1
  validates_length_of :rating, maximum: 5
end
