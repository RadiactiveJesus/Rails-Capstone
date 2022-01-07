require 'test_helper'

class YpagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get ypages_new_url
    assert_response :success
  end

  test 'should get create' do
    get ypages_create_url
    assert_response :success
  end

  test 'should get update' do
    get ypages_update_url
    assert_response :success
  end

  test 'should get edit' do
    get ypages_edit_url
    assert_response :success
  end

  test 'should get destroy' do
    get ypages_destroy_url
    assert_response :success
  end

  test 'should get index' do
    get ypages_index_url
    assert_response :success
  end

  test 'should get show' do
    get ypages_show_url
    assert_response :success
  end
end
