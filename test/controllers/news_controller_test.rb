require "test_helper"

class NewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news = news(:one)
  end

  test "should get index" do
    get news_index_url, as: :json
    assert_response :success
  end

  test "should create news" do
    assert_difference("News.count") do
      post news_index_url, params: { news: { content: @news.content, image: @news.image, is_delited: @news.is_delited, tags: @news.tags, title: @news.title, user_id: @news.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show news" do
    get news_url(@news), as: :json
    assert_response :success
  end

  test "should update news" do
    patch news_url(@news), params: { news: { content: @news.content, image: @news.image, is_delited: @news.is_delited, tags: @news.tags, title: @news.title, user_id: @news.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy news" do
    assert_difference("News.count", -1) do
      delete news_url(@news), as: :json
    end

    assert_response :no_content
  end
end
