class Station < ApplicationRecord
    has_many :chains
    has_many :commands, through: :chain
end
