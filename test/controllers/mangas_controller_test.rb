require 'test_helper'

class MangasControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @manga = mangas(:alchemist)
    @user = users(:ali)
    sign_in @user
  end

  test "should get new" do
    get new_manga_url
    assert_response :success
  end

  test "should create manga" do
    assert_difference('Manga.count') do
      post mangas_url, params: {
        manga: {
          description: @manga.description,
          image_data: @manga.image_data,
          title: @manga.title,
          user_id: @manga.user_id,
          volumes: @manga.volumes,
        }
      }
    end

    assert_redirected_to user_url @user
  end

  test "should get edit" do
    get edit_manga_url(@manga)
    assert_response :success
  end

  test "should update manga" do
    patch manga_url(@manga), params: {
      manga: {
        description: @manga.description,
        title: @manga.title,
        user_id: @manga.user_id,
        volumes: @manga.volumes,
        image_data: @manga.image_data,
      }
    }
    assert_redirected_to user_url @user
  end

  test "should destroy manga" do
    assert_difference('Manga.count', -1) do
      delete manga_url(@manga)
    end

    assert_redirected_to user_url @user
  end
end
