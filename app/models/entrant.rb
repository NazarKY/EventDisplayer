class Entrant < ApplicationRecord
  belongs_to :event
  belongs_to :player

  validates :player, uniqueness: { scope: :event }

  delegate :full_name, to: :player
end
