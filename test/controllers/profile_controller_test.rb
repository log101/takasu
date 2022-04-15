require 'test_helper'

class ProfileControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:ali)
    sign_in @user
  end


  test "should get show" do
    get user_url @user
    assert_response :success

    assert_select "p", @user.email
  end

end
