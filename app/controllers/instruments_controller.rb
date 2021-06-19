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
    result = UnsplashSearch.new(instrument_name)
    instrument = Instrument.create(name: instrument_name, tunings: instrument_tunings, image_link: result.image_link,
                                   image_artist: result.image_artist, image_artist_link: result.image_artist_link)
    if instrument.errors.any?
      render json: { status: 'error', code: 500, message: instrument.errors.full_messages.join("\n\n") }
    else
      render json: InstrumentSerializer.new(instrument, include: [:tunings]).serializable_hash.to_json
    end
  end

  def destroy
    instrument_id = params[:id]
    instrument = Instrument.find(instrument_id)
    instrument.destroy
    if instrument.errors.any?
      render json: { status: 'error', code: 500, message: instrument.errors.full_messages.join("\n\n") }
    else
      render json: InstrumentSerializer.new(instrument).serializable_hash.to_json
    end
  end
end
