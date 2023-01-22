class Player < ApplicationRecord
  validates :full_name, uniqueness: true
end
