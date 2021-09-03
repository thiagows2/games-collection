require 'test_helper'

class ConsoleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @console_type = console_types(:one)
  end

  test "should get index" do
    get console_types_url
    assert_response :success
  end

  test "should get new" do
    get new_console_type_url
    assert_response :success
  end

  test "should create console_type" do
    assert_difference('ConsoleType.count') do
      post console_types_url, params: { console_type: { acronym: @console_type.acronym, description: @console_type.description } }
    end

    assert_redirected_to console_type_url(ConsoleType.last)
  end

  test "should show console_type" do
    get console_type_url(@console_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_console_type_url(@console_type)
    assert_response :success
  end

  test "should update console_type" do
    patch console_type_url(@console_type), params: { console_type: { acronym: @console_type.acronym, description: @console_type.description } }
    assert_redirected_to console_type_url(@console_type)
  end

  test "should destroy console_type" do
    assert_difference('ConsoleType.count', -1) do
      delete console_type_url(@console_type)
    end

    assert_redirected_to console_types_url
  end
end
