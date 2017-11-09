require 'test_helper'

class CommmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commments_index_url
    assert_response :success
  end

  test "should get new" do
    get commments_new_url
    assert_response :success
  end

  test "should get create" do
    get commments_create_url
    assert_response :success
  end

  test "should get show" do
    get commments_show_url
    assert_response :success
  end

  test "should get edit" do
    get commments_edit_url
    assert_response :success
  end

  test "should get update" do
    get commments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get commments_destroy_url
    assert_response :success
  end

end
