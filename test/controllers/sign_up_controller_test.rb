require 'test_helper'

describe SignUpController do
  it 'must get registration form' do
    get :new
    assert_response :success
  end

  it 'must register user' do
    assert_difference('User.count') do
      post :create, user: Fabricate.attributes_for(:user)
    end
    refute_nil session[:user_id]
    assert_redirected_to root_url
  end

  it 'must refuse invalid registration' do
    assert_no_difference('User.count') do
      post :create, user: { email: '@yahoo.co.jp' }
    end
    assert_response :success
  end
end
