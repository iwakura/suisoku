ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
#require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  class << self
    alias :context :describe
  end

  private


end