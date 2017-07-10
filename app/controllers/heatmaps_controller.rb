class HeatmapsController < ApplicationController


  # GET /customers
  def index
    #@customers = Customer.all
    json_response(Heatmap.all)
  end


  # POST /customers
  def create
    @heatmap = Heatmap.create!(heatmap_params)
    json_response(@heatmap, :created)
  end


  def heatmap_params
    # whitelist params
    params.permit(:start_date, :end_date, :map)
  end

end
