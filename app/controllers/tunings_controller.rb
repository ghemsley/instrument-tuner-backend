class TuningsController < ApplicationController
  def index
    tunings = Tuning.all
    render json: TuningSerializer.new(tunings)
  end

  def show
    tuning = Tuning.find(params[:id])
    render json: TuningSerializer.new(tuning).serializable_hash.to_json
  end
end
