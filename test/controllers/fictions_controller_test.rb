require 'test_helper'

class FictionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fiction = fictions(:one)
  end

  test "should get index" do
    get fictions_url
    assert_response :success
  end

  test "should get new" do
    get new_fiction_url
    assert_response :success
  end

  test "should create fiction" do
    assert_difference('Fiction.count') do
      post fictions_url, params: { fiction: { author: @fiction.author, name: @fiction.name, price: @fiction.price, reviews: @fiction.reviews, year: @fiction.year } }
    end

    assert_redirected_to fiction_url(Fiction.last)
  end

  test "should show fiction" do
    get fiction_url(@fiction)
    assert_response :success
  end

  test "should get edit" do
    get edit_fiction_url(@fiction)
    assert_response :success
  end

  test "should update fiction" do
    patch fiction_url(@fiction), params: { fiction: { author: @fiction.author, name: @fiction.name, price: @fiction.price, reviews: @fiction.reviews, year: @fiction.year } }
    assert_redirected_to fiction_url(@fiction)
  end

  test "should destroy fiction" do
    assert_difference('Fiction.count', -1) do
      delete fiction_url(@fiction)
    end

    assert_redirected_to fictions_url
  end
end
