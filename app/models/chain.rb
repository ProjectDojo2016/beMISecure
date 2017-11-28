class Chain < ApplicationRecord
    has_many :parking_events
    has_many :phone_requests

end
