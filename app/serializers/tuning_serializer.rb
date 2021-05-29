class TuningSerializer
  include JSONAPI::Serializer

  belongs_to :instrument

  attribute :name
  attribute :notes do |object|
    object.notes_array
  end
  set_key_transform :camel_lower
end
