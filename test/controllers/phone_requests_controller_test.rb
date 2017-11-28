require 'test_helper'

class PhoneRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone_request = phone_requests(:one)
  end

  test "should get index" do
    get phone_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_phone_request_url
    assert_response :success
  end

  test "should create phone_request" do
    assert_difference('PhoneRequest.count') do
      post phone_requests_url, params: { phone_request: {  } }
    end

    assert_redirected_to phone_request_url(PhoneRequest.last)
  end

  test "should show phone_request" do
    get phone_request_url(@phone_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_phone_request_url(@phone_request)
    assert_response :success
  end

  test "should update phone_request" do
    patch phone_request_url(@phone_request), params: { phone_request: {  } }
    assert_redirected_to phone_request_url(@phone_request)
  end

  test "should destroy phone_request" do
    assert_difference('PhoneRequest.count', -1) do
      delete phone_request_url(@phone_request)
    end

    assert_redirected_to phone_requests_url
  end
end
