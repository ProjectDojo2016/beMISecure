class Chain < ApplicationRecord
    has_many :parking_events
    has_many :phone_requests
    belongs_to :station
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
8