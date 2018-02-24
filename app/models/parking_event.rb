class ParkingEvent < ApplicationRecord
  belongs_to :user  
  belongs_to :chain

def isCompleted?
    if self.getbikecomplited
        return true
    else
        return false
    end
end
end



