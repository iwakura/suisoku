ENV['RAILS_ENV'] = 'test'
ENV['ZOOPLA_KEY'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'webmock/minitest'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  class << self
    alias :context :describe
    alias :should :it
  end

  private

  def login_as(user)
    session[:user_id] = user.id
  end

  WebMock::API.stub_request(:get, 'http://api.zoopla.co.uk/api/v1/property_listings.js?api_key=test&listing_status=sale&listing_id=1&page_number=1').to_return(status: 200, body: Rails.root.join('test/data/property_listing.json').read)
  WebMock::API.stub_request(:get, 'http://api.zoopla.co.uk/api/v1/property_listings.js?api_key=test&listing_status=sale&property_type=houses&postcode=NW1+0DU&radius=50&order_by=age&page_number=1').to_return(status: 200, body: Rails.root.join('test/data/property_listings.json').read)
end
