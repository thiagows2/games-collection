require 'test_helper'

class ConsolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @console = consoles(:one)
  end

  test "should get index" do
    get consoles_url
    assert_response :success
  end

  test "should get new" do
    get new_console_url
    assert_response :success
  end

  test "should create console" do
    assert_difference('Console.count') do
      post consoles_url, params: { console: { acronym: @console.acronym, description: @console.description, url_image: @console.url_image } }
    end

    assert_redirected_to console_url(Console.last)
  end

  test "should show console" do
    get console_url(@console)
    assert_response :success
  end

  test "should get edit" do
    get edit_console_url(@console)
    assert_response :success
  end

  test "should update console" do
    patch console_url(@console), params: { console: { acronym: @console.acronym, description: @console.description, url_image: @console.url_image } }
    assert_redirected_to console_url(@console)
  end

  test "should destroy console" do
    assert_difference('Console.count', -1) do
      delete console_url(@console)
    end

    assert_redirected_to consoles_url
  end
end
