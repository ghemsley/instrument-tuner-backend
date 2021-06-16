class InstrumentSerializer
  include JSONAPI::Serializer

  has_many :tunings

  attributes :name, :image_link, :image_artist, :image_artist_link
end
