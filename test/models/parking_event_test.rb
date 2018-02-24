require 'test_helper'

class ParkingEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
 test "ciao" do
    p= ParkingEvent.find(3)
    assert p.isCompleted? == true
  end 
  
 test "ciao2" do
    p= ParkingEvent.find(2)
    assert p.isCompleted? == true
  end 
  
  test "ciao3" do
    p= ParkingEvent.find(1)
    assert p.isCompleted? == true
  end 
  
end
