module Listing

  def self.random_for(user)
    guessed = user.guesses.pluck(:listing_id)
    sales = []
    api.houses.in(postcode: 'NW1 0DU').within(50).order_by(:age).each do |item|
      sales << item unless guessed.member?(item.listing_id) || item.price.zero? || item.image_url.blank?
      break if sales.size > 9
    end
    sales.shuffle.first
  end

  def self.by_id(listing_id)
    list = []
    api.listing_id(listing_id).each {|item| list << item }
    list.first
  end

  def self.api
    Zoopla.new(ENV['ZOOPLA_KEY']).sales
  end
end
