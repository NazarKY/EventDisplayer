class Entrant < ApplicationRecord
  belongs_to :event
  belongs_to :player
end
