class Tuning < ApplicationRecord
  belongs_to :instrument

  validates :name, presence: true, format: { with: /\A[[:alpha:]]+\Z/ }
  validates :notes, presence: true, format: { with: /\A([A-G]#?[0-9](, )?)*([A-G]#?[0-9](?!, \Z)){1}\Z/ }

  def notes_array
    notes.split(', ')
  end
end
