require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:one)
  end

  test "should get index" do
    get pages_url, as: :json
    assert_response :success
  end

  test "should create page" do
    assert_difference("Page.count") do
      post pages_url, params: { page: { content: @page.content, image: @page.image, is_delited: @page.is_delited, tags: @page.tags, title: @page.title, user_id: @page.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show page" do
    get page_url(@page), as: :json
    assert_response :success
  end

  test "should update page" do
    patch page_url(@page), params: { page: { content: @page.content, image: @page.image, is_delited: @page.is_delited, tags: @page.tags, title: @page.title, user_id: @page.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy page" do
    assert_difference("Page.count", -1) do
      delete page_url(@page), as: :json
    end

    assert_response :no_content
  end
end
