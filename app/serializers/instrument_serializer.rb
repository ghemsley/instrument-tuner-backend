class InstrumentSerializer
  include JSONAPI::Serializer

  has_many :tunings

  attributes :name, :image
end
