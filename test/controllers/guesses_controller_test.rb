require 'test_helper'

describe GuessesController do
  context 'as a logged in user' do
    setup do
      login_as Fabricate(:user)
    end

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

    should 'get guess form' do
      get :new
      assert_response :success
    end

    should 'save incorrect guess' do
      assert_difference('Guess.incorrect.count') do
        post :create, :guess => Fabricate.attributes_for(:guess)
      end
      assert_response :redirect
    end

    should 'save successful guess' do
      assert_difference('Guess.correct.count') do
        post :create, :guess => Fabricate.attributes_for(:guess).merge(price: 10000)
      end
    end
  end
end
