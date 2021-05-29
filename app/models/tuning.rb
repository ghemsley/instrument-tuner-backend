class Tuning < ApplicationRecord
  belongs_to :instrument
  
  def notes_array
    notes.split(', ')
  end
end
