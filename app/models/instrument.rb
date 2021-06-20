class Instrument < ApplicationRecord
  has_many :tunings, dependent: :destroy

  validates :name, presence: true, allow_blank: false, format: { with: /\A[[:alpha:]\d\-\/() ]+\Z/ }
  validates_associated :tunings
end
