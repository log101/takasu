require "application_system_test_case"

class TradesTest < ApplicationSystemTestCase
  setup do
    @trade = trades(:one)
  end

  test "visiting the index" do
    visit trades_url
    assert_selector "h1", text: "Trades"
  end

  test "creating a Trade" do
    visit trades_url
    click_on "New Trade"

    check "Confirmed" if @trade.confirmed
    fill_in "Recipient", with: @trade.recipient_id
    fill_in "Sender", with: @trade.sender_id
    click_on "Create Trade"

    assert_text "Trade was successfully created"
    click_on "Back"
  end

  test "updating a Trade" do
    visit trades_url
    click_on "Edit", match: :first

    check "Confirmed" if @trade.confirmed
    fill_in "Recipient", with: @trade.recipient_id
    fill_in "Sender", with: @trade.sender_id
    click_on "Update Trade"

    assert_text "Trade was successfully updated"
    click_on "Back"
  end

  test "destroying a Trade" do
    visit trades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trade was successfully destroyed"
  end
end
