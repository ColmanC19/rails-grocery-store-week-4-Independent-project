class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    )}
    validates :name, presence: true
    validates :cost, presence: true
    validates :country_of_origin, presence: true
    before_save(:titleize_product)

    private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize()
    end
  end
