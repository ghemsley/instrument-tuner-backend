class InstrumentsController < ApplicationController
  def index 
    instruments = Instrument.all
    render json: InstrumentSerializer.new(instruments, include: [:tunings]).serializable_hash.to_json
  end

  def show
    instrument = Instrument.find(params[:id])
    render json: InstrumentSerializer.new(instrument, include: [:tunings]).serializable_hash.to_json
  end
end
