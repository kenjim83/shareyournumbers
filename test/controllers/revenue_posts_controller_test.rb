require 'test_helper'

class RevenuePostsControllerTest < ActionController::TestCase
  setup do
    @revenue_post = revenue_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:revenue_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create revenue_post" do
    assert_difference('RevenuePost.count') do
      post :create, revenue_post: { distributor_id: @revenue_post.distributor_id, movie_id: @revenue_post.movie_id, published: @revenue_post.published, revenue: @revenue_post.revenue, source_url: @revenue_post.source_url, user_id: @revenue_post.user_id }
    end

    assert_redirected_to revenue_post_path(assigns(:revenue_post))
  end

  test "should show revenue_post" do
    get :show, id: @revenue_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @revenue_post
    assert_response :success
  end

  test "should update revenue_post" do
    patch :update, id: @revenue_post, revenue_post: { distributor_id: @revenue_post.distributor_id, movie_id: @revenue_post.movie_id, published: @revenue_post.published, revenue: @revenue_post.revenue, source_url: @revenue_post.source_url, user_id: @revenue_post.user_id }
    assert_redirected_to revenue_post_path(assigns(:revenue_post))
  end

  test "should destroy revenue_post" do
    assert_difference('RevenuePost.count', -1) do
      delete :destroy, id: @revenue_post
    end

    assert_redirected_to revenue_posts_path
  end
end
