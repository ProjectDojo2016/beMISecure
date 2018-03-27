class ParkingEvent < ApplicationRecord
    belongs_to :user
    belongs_to :chain
    def isCompleted?
        
        if self.getbikecompleted
            return true
        else
            return false
        end 
        
    end

end
