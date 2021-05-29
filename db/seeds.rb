# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
tunings = Tuning.create([{ name: 'Standard', notes: 'E2, A2, D3, G3, B3, E4' },
                         { name: 'Drop D', notes: 'D2, A2, D3, G3, B3, E4' },
                         { name: 'Drop C', notes: 'C2, G2, C3, F3, A3, D4' }])
guitar = Instrument.create({name: 'Guitar'})
tunings.each do |tuning|
  tuning.instrument = guitar
  tuning.save
end
