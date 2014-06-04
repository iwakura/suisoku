require 'test_helper'

describe Listing do
  describe 'for user' do
    before do
      @user = Fabricate(:user)
    end

    describe 'with guess history' do
      before do
        guessed = [28219681, 28052357, 28042624, 27944365, 27944368, 27944366, 27869121, 26434020]
        guessed.each do |lid|
          g = @user.guesses.new(listing_id: lid)
          ActiveRecord::Persistence.instance_method(:create_record).bind(g).call
        end
      end

      it 'should find unguessed listing' do
        listing = Listing.random_for @user
        assert_equal listing.listing_id, 26397077
      end
    end
  end
end
