require 'test_helper'

class AuthorizationTest < ActionDispatch::IntegrationTest
  setup do
    @user = create :user
  end

  test "open #/session/new page" do
    WelcomePage.visit
  end
end
