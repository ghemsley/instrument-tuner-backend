class Instrument < ApplicationRecord
  has_many :tunings
  has_one_attached :image

  validates :name, presence: true, format: { with: /\A[[:alpha:]]+\Z/ }
  validates_associated :tunings
end
