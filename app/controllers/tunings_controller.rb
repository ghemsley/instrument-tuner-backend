class TuningsController < ApplicationController
  include JSONAPI::Filtering

  def index
    allowed = %i[instrument_id]
    tunings = Tuning.all
    jsonapi_filter(tunings, allowed) do |filtered|
      render jsonapi: filtered.result
    end
  end

  def show
    tuning = Tuning.find(params[:id])
    render json: TuningSerializer.new(tuning).serializable_hash.to_json
  end

  def create
    success = true
    instrument_id = params[:instrumentID]
    tunings = params[:tunings].collect do |tuning_json|
      tuning = Tuning.create(instrument_id: instrument_id, name: tuning_json[:name],
                             notes: tuning_json[:notes].join(', '))
      tuning
    end
    tunings.each do |tuning|
      next unless tuning.errors.any?

      success = false
      render json: { status: 'error', code: 500, message: tuning.errors.full_messages.join("\n\n") }
      break
    end
    render json: TuningSerializer.new(tunings).serializable_hash.to_json if success
  end
end
