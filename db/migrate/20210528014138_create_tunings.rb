class CreateTunings < ActiveRecord::Migration[6.1]
  def change
    create_table :tunings do |t|
      t.belongs_to :instrument
      
      t.string :name, null: false
      t.string :notes, null: false

      t.timestamps
    end
  end
end
