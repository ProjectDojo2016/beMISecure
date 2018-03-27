require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "Utente attivo" do
    u = User.find(1)
    assert u.isActive? == true
  end
  
  test "Utente 1 ha la bici sulla catena 2" do
    u = User.find(1)
    assert u.hasBikeParkedIn?(Chain.find(2)) ,"no la bici non c'e"
  end
  
  test "Utente 1 NON ha la bici sulla catena 3" do
    u = User.find(1)
    assert_not u.hasBikeParkedIn?(Chain.find(3)) ,"si ho trovato la bici"
  end
  
  test "Utente 1 NON ha la bici sulla catena 1" do
    u = User.find(1)
    assert_not u.hasBikeParkedIn?(Chain.find(1)) ,"si ho trovato la bici"
  end
  
  test "Utente 2 HA ha la bici sulla catena 1" do
    u = User.find(2)
    c = Chain.find(1)
    assert u.hasBikeParkedIn?(c) ,"No non ho trovato la bici"
  end
  
  
end

  
end
