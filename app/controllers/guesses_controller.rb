class GuessesController < ApplicationController
  before_action :require_login

  def index
    @guesses = current_user.guesses.order('id DESC')
  end

  def new
    @listing = Listing.random_for current_user
    @guesses = Guess.prepare_for(@listing)
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
