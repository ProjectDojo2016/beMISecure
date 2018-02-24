require 'test_helper'

class ChainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

 test "ciao4" do
    c=Chain.find(2)
    assert c.isFree? == true
end 
 test "ciao5" do
    c=Chain.find(3)
    assert c.isFree? == true
end 
test "ciao6" do
    c=Chain.find(4)
    assert c.isFree? == false
end 


end
  
