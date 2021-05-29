class Instrument < ApplicationRecord
  has_many :tunings
  has_one_attached :image
end
