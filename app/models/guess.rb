class Guess < ActiveRecord::Base
  belongs_to :user

  attr_accessor :price

  before_create :check_price

  scope :correct, -> { where(successful: true) }
  scope :incorrect, -> { where(successful: false) }

  def self.prepare_for(listing)
    master_price = listing.price
    prices = [master_price]
    until 3 == prices.size do
      delta = (master_price * ((rand * 40).to_i/100.0)).to_i / 1000 * 1000
      prices << master_price.send((rand < 0.5 ? :+ : :-), delta)
      prices.uniq!
    end
    prices.shuffle!
    prices.collect do |price|
      Guess.new listing_id: listing.listing_id, price: price
    end
  end

  def check_price
    if listing = Listing.by_id(listing_id)
      self.successful = true if listing.price == price.to_i
    end
  end
end
