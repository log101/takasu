require "application_system_test_case"

class TradesTest < ApplicationSystemTestCase
  setup do
    @trade = trades(:one)
    @user = users(:ali)
    @recipient_user = users(:veli)
  end

  def log_in_user(user)
    visit new_user_session_url

    fill_in "Email", with: user.email
    fill_in "Password", with: "password" # Had to hardcode :(

    click_on "Log in"

    assert_text "Signed in successfully"
  end

  test "visiting the index" do
    log_in_user(@user)
    visit trades_url
    assert_selector "h1", text: "Your Trade Requests"
  end

  test "make a trade" do
    log_in_user(@user)
    visit user_url(@recipient_user)
    click_on "Send trade request"

    assert_no_selector ".trade-item"
    assert_text "Trade Request"
    click_on "Add", match: :first
    assert_selector ".trade-item"

    click_on "Confirm Trade"
    assert_text "Undo Confirmation"

    visit root_url
    click_on "Sign out"
    log_in_user(@recipient_user)

    click_on "Your trade requests"
    click_on "Show"
    page.accept_confirm do
      click_on "Confirm Trade"
    end

    assert_text "Trade successfully completed"
  end

  test "destroying a Trade" do
    log_in_user(@user)
    visit user_url(@recipient_user)
    click_on "Send trade request"

    assert_no_selector ".trade-item"
    assert_text "Trade Request"
    click_on "Add", match: :first
    assert_selector ".trade-item"

    click_on "Confirm Trade"
    assert_text "Undo Confirmation"

    visit root_url
    click_on "Sign out"
    log_in_user(@recipient_user)

    click_on "Your trade requests"
    page.accept_confirm do
      click_on "Reject", match: :first
    end

    assert_text "Trade was successfully destroyed"
  end
end
