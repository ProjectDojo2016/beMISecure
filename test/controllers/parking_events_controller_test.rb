require 'test_helper'

class ParkingEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_event = parking_events(:one)
  end

  test "should get index" do
    get parking_events_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_event_url
    assert_response :success
  end

  test "should create parking_event" do
    assert_difference('ParkingEvent.count') do
      post parking_events_url, params: { parking_event: { datetime: @parking_event.datetime, datetime: @parking_event.datetime, getbikecompleted: @parking_event.getbikecompleted, parkallowed: @parking_event.parkallowed, parkcompleted: @parking_event.parkcompleted, parkrequest: @parking_event.parkrequest } }
    end

    assert_redirected_to parking_event_url(ParkingEvent.last)
  end

  test "should show parking_event" do
    get parking_event_url(@parking_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_event_url(@parking_event)
    assert_response :success
  end

  test "should update parking_event" do
    patch parking_event_url(@parking_event), params: { parking_event: { datetime: @parking_event.datetime, datetime: @parking_event.datetime, getbikecompleted: @parking_event.getbikecompleted, parkallowed: @parking_event.parkallowed, parkcompleted: @parking_event.parkcompleted, parkrequest: @parking_event.parkrequest } }
    assert_redirected_to parking_event_url(@parking_event)
  end

  test "should destroy parking_event" do
    assert_difference('ParkingEvent.count', -1) do
      delete parking_event_url(@parking_event)
    end

    assert_redirected_to parking_events_url
  end
end
