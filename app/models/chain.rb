class Chain < ApplicationRecord
    has_many :parking_events
    has_many :phone_request

    def isFree?
        if self.parking_events.last.nil?
            return true
        end
          if self.parking_events.last.isCompleted?
             return true
            else
                return false
        end
     
        
    end   
end