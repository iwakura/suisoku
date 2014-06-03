require 'test_helper'

class GuessesControllerTest < ActionController::TestCase
  context 'with guess' do
    setup do
      @guess = Fabricate(:guess)
    end

    should 'get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:guesses)
    end
  end

  should 'get creation form' do
    get :new
    assert_response :success
  end

  should 'create guess' do
    assert_difference('Guess.count') do
      post :create, :guess => Fabricate.attributes_for(:guess)
    end
    assert_redirected_to guess_url(assigns(:guess))
  end
end
