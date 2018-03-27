require 'test_helper'
class ChainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "catena libera" do
     catena = Chain.find(3)
     assert catena.isFree?
     catena2 = Chain.find(2)
     assert_not catena2.isFree?
     catena3 = Chain.find(4)
     assert catena3.isFree?
     catena4 = Chain.find(1)
     assert_not catena4.isFree?, "la catena 1 non è libera"
  end

end
  
