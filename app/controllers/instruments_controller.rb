class InstrumentsController < ApplicationController
  def index
    instruments = Instrument.all
    render json: InstrumentSerializer.new(instruments, include: [:tunings]).serializable_hash.to_json
  end

  def show
    instrument = Instrument.find(params[:id])
    render json: InstrumentSerializer.new(instrument, include: [:tunings]).serializable_hash.to_json
  end

  def create
    instrument_name = params[:name]
    instrument_tunings = params[:tunings].collect do |tuning_json|
      tuning_name = tuning_json[:name]
      tuning_string = tuning_json[:notes].join(', ')
      tuning = Tuning.create(name: tuning_name, notes: tuning_string)
      tuning
    end
    result = Unsplash::Photo.search(instrument_name, per_page = 1)
    image_link = result.first.urls.small
    image_artist = result.first.user.name
    image_artist_link = result.first.user.links.html
    instrument = Instrument.create(name: instrument_name, tunings: instrument_tunings, image_link: image_link, image_artist: image_artist, image_artist_link: image_artist_link)
    render json: InstrumentSerializer.new(instrument, include: [:tunings]).serializable_hash.to_json
  end

  def destroy
    instrument_id = params[:id]
    instrument = Instrument.find(instrument_id)
    instrument.destroy
    render json: InstrumentSerializer.new(instrument).serializable_hash.to_json
  end
end
