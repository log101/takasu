require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "can't get index without signing" do
    get '/'
    assert_redirected_to new_user_session_url
  end

  test "can get index after signing in" do
    sign_in users(:ali)

    get '/'
    assert_select "h1", "Welcome to Takasu!"
  end
end
