class Player < ApplicationRecord
  validates :full_name, uniqueness: true

  has_many :entrants
end
