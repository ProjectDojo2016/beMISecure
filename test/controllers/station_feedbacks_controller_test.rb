require 'test_helper'

class StationFeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @station_feedback = station_feedbacks(:one)
  end

  test "should get index" do
    get station_feedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_station_feedback_url
    assert_response :success
  end

  test "should create station_feedback" do
    assert_difference('StationFeedback.count') do
      post station_feedbacks_url, params: { station_feedback: { azione: @station_feedback.azione } }
    end

    assert_redirected_to station_feedback_url(StationFeedback.last)
  end

  test "should show station_feedback" do
    get station_feedback_url(@station_feedback)
    assert_response :success
  end

  test "should get edit" do
    get edit_station_feedback_url(@station_feedback)
    assert_response :success
  end

  test "should update station_feedback" do
    patch station_feedback_url(@station_feedback), params: { station_feedback: { azione: @station_feedback.azione } }
    assert_redirected_to station_feedback_url(@station_feedback)
  end

  test "should destroy station_feedback" do
    assert_difference('StationFeedback.count', -1) do
      delete station_feedback_url(@station_feedback)
    end

    assert_redirected_to station_feedbacks_url
  end
end
