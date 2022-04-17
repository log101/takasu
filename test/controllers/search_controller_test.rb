require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:ali)
    sign_in @user
  end

  test "should get index" do
    get search_url
    assert_response :success
  end

end
