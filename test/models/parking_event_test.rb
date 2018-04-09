require 'test_helper'

class ParkingEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "parcheggio completato" do
    parcheggio = ParkingEvent.find(1)
    assert parcheggio.isCompleted?
    
    parcheggio2 = ParkingEvent.find(3)
    assert_not parcheggio2.isCompleted?
    
  end

end
