# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
guitar_tunings = Tuning.create([{ name: 'Standard', notes: 'E2, A2, D3, G3, B3, E4' },
                                { name: 'Drop D', notes: 'D2, A2, D3, G3, B3, E4' },
                                { name: 'Drop C', notes: 'C2, G2, C3, F3, A3, D4' }])
guitar = Instrument.create({ name: 'Guitar' })
guitar_tunings.each do |tuning|
  tuning.instrument = guitar
  tuning.save
end

violin_tunings = Tuning.create([{ name: 'Standard', notes: 'G3, D4, A4, E5' },
                                { name: 'Open G', notes: 'G3, D4, G4, D5' },
                                { name: 'Open A', notes: 'A3, E4, A4, E5' }])
violin = Instrument.create({ name: 'Violin' })
violin_tunings.each do |tuning|
  tuning.instrument = violin
  tuning.save
end

[guitar, violin].each do |instrument|
  result = Unsplash::Photo.search(instrument.name, per_page = 1)
  image_link = result.first.urls.small
  image_artist = result.first.user.name
  image_artist_link = result.first.user.links.html
  instrument.update(image_link: image_link, image_artist: image_artist, image_artist_link: image_artist_link)
end
