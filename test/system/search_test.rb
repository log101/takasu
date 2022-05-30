require "application_system_test_case"

class SearchTest < ApplicationSystemTestCase
  setup do
    @manga = mangas(:alchemist)
    @user = users(:ali)
  end

  def log_in_user(user)
    visit new_user_session_url

    fill_in "Email", with: user.email
    fill_in "Password", with: "password" # Had to hardcode :(

    click_on "Log in"

    assert_text "Signed in successfully"
  end
end