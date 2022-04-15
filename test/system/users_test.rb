require "application_system_test_case"

class MangasTest < ApplicationSystemTestCase
  setup do
    @user = users(:ali)
  end

  test "logging in" do
    visit new_user_session_url

    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"

    click_on "Log in"

    assert_text "Signed in successfully"
  end

  test "signing up" do
    visit new_user_registration_url

    fill_in "Email", with: "sample@mail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"

    click_on "Sign up"

    assert_text "Welcome! You have signed up successfully."
  end
end