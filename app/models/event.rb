class Event < ApplicationRecord
  validates :name, uniqueness: true

  has_many :entrants
  has_many :players, through: :entrants
end
