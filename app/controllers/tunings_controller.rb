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
    logger.info(params)
  end
end
