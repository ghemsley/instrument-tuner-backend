class Instrument < ApplicationRecord
  has_many :tunings

  validates :name, presence: true, format: { with: /\A[[:alpha:] ]+\Z/ }
  validates_associated :tunings
end
