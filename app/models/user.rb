class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :parking_events
         has_many :phone_request
         
    def hasBikeParkedin? cat
        if cat.parking_events.last.user.id==self.id and !cat.parking_events.last.isCompleted?
             return true
        else
            return false
            
        end
    end
    
    def isActive?
        return true
    end

end

