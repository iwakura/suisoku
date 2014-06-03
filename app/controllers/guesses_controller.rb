class GuessesController < ApplicationController
  before_action :require_login

  def index
    @guesses = current_user.guesses.order('id DESC')
  end

  def new
    @listing = Listing.random_for current_user
    master_price = @listing.price
    prices = [master_price]
    2.times { prices << master_price.send((rand < 0.5 ? :+ : :-), master_price * ((rand * 40).to_i/100.0)).to_i }
    prices.shuffle!
    @guesses = prices.collect do |price|
      @guess = Guess.new listing_id: @listing.listing_id, price: price
    end
  end

  def create
    guess = current_user.guesses.create(guess_params)
    redirect_to root_url, notice: "You Guessed #{guess.successful ? 'Right' : 'Wrong'}."
  end

  private

    def guess_params
      params.require(:guess).permit(:listing_id, :price)
    end
end
