require "application_system_test_case"

class MangasTest < ApplicationSystemTestCase
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

  test "creating a Manga" do
    log_in_user(@user)
    visit new_manga_url

    fill_in "Title", with: @manga.title
    fill_in "Volumes", with: @manga.volumes
    fill_in "Description", with: @manga.description
    attach_file "image-field", "test/assets/images/alchemist.jpg"
    click_on "Create Manga"

    assert_text "Manga was successfully created"
  end

  test "updating a Manga" do
    log_in_user(@user)
    visit user_url @user

    click_on "Edit", match: :first

    fill_in "Description", with: @manga.description
    fill_in "Title", with: @manga.title
    fill_in "Volumes", with: @manga.volumes
    attach_file "image-field", "test/assets/images/alchemist.jpg"
    click_on "Update Manga"

    assert_text "Manga was successfully updated"
  end

  test "destroying a Manga" do
    log_in_user(@user)
    visit user_url @user

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manga was successfully destroyed"
  end
end
