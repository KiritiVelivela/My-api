class TrajectsController < ApplicationController

  before_action :set_customer
  before_action :set_customer_trajectory, only: [:show, :update, :destroy]


  # GET /customers/:customer_id/items
  def index
    json_response(@customer.items)
  end

  # GET /customers/:customer_id/items/:id
  def show
    json_response(@traject)
  end

  # POST /customers/:customer_id/items
  def create
    @customer.items.create!(trajectory_params)
    json_response(@customer, :created)
  end

  # PUT /customers/:customer_id/items/:id
  def update
    @traject.update(trajectory_params)
    head :no_content
  end

  # DELETE /customers/:customer_id/items/:id
  def destroy
    @traject.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:traject, :position)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_customer_trajectory
    @traject = @customer.trajects.find_by!(id: params[:id]) if @customer
  end

end
