require 'test_helper'

class WelcomePageTest < ActionDispatch::IntegrationTest
  setup do
  end

  test "visit #/" do
    page = WelcomePage.visit
    assert { page.navbar }
  end
end
