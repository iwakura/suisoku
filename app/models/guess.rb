class Guess < ActiveRecord::Base
  belongs_to :user

  attr_accessor :price

  before_create :check_price

  scope :correct, -> { where(successful: true) }
  scope :incorrect, -> { where(successful: false) }

  def check_price
    if listing = Listing.by_id(listing_id)
      self.successful = true if listing.price == price.to_i
    end
  end
end
