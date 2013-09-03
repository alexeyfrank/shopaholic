require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should post create" do
    attrs = attributes_for :user
    post :create, user: attrs, format: :json
    assert_response :success

    user = User.find_by(email: attrs[:email])
    assert { user.present? }
  end
end
