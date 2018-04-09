class Chain < ApplicationRecord
    has_many :parking_events
    has_many :phone_requests
    belongs_to :station
<<<<<<< HEAD
    has_many :commands
=======
    has_many :phone_request
>>>>>>> d520d55045af21722eebdb873ceb9672a453bce8

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

