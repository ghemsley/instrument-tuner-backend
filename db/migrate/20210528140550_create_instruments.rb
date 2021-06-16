class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.string :name
      t.string :image_link
      t.string :image_artist
      t.string :image_artist_link

      t.timestamps
    end
  end
end
