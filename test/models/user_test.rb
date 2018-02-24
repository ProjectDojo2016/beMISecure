require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "ciao" do
    u= User.find(1)
    assert u.isActive? == true
  end
  test "ciao7" do
    u= User.find(1)
    c= Chain.find(5)
    assert u.hasBikeParkedin?(c)  == true
  end
  
end