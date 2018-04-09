class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :parking_events
  has_many :phone_requests
  #verify if User has payed subscription
  def isActive? 
    return true
  end 
  
  def hasBikeParkedIn?(catena)
    
    if catena.parking_events.last.nil?
      return false
    end
    
    if catena.parking_events.last.user.id == self.id and !catena.parking_events.last.isCompleted?
      return true 
    else
      return false
    end

  end

end

