class PhoneRequest < ApplicationRecord
    belongs_to :chain
    belongs_to :user
end
