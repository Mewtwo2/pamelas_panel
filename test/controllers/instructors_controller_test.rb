require 'test_helper'

class InstructorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get instructors_new_url
    assert_response :success
  end

  test "should get edit" do
    get instructors_edit_url
    assert_response :success
  end

  test "should get index" do
    get instructors_index_url
    assert_response :success
  end

  test "should get show" do
    get instructors_show_url
    assert_response :success
  end

end
