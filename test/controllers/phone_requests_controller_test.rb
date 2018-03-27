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

  test "new parking con catena gia usata" do
    assert_difference('ParkingEvent.count') do
      post phone_requests_url, params: { phone_request: {"user_id":1,"chain_id":4  } }
    end
    
#    assert_redirected_to phone_request_url(PhoneRequest.last)
  end

  test "new parking con catena mai usata" do
    assert_difference('ParkingEvent.count') do
      post phone_requests_url, params: { phone_request: {"user_id":1,"chain_id":3  } }
    end
    
#    assert_redirected_to phone_request_url(PhoneRequest.last)
  end


  test "failed request new parking" do
    assert_no_difference('ParkingEvent.count') do
      post phone_requests_url, params: { phone_request: {"user_id":2,"chain_id":2  } 
    end

   # assert PhoneRequest.last.response == "Parcheggio occupato da altro utente o utente non attivo"
    assert_redirected_to phone_request_url(PhoneRequest.last)
  end

  test "update parking" do
    assert_no_difference('ParkingEvent.count') do
      post phone_requests_url, params: { phone_request: {"user_id":1,"chain_id":2  } }
    end
    
    assert_not ParkingEvent.find(3).getbikerequest.nil?
    assert ParkingEvent.find(3).getbikecompleted.nil?
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



  test "should destroy phone_request" do
    assert_difference('PhoneRequest.count', -1) do
      delete phone_request_url(@phone_request)
    end

    assert_redirected_to phone_requests_url
  end


test "test8" do
  assert_difference('ParkingEvent.count')do
    post phone_request_url,params:{phone_request:{"user_id":1,"chain_id":6}}
  end
end
end
