class CustomersController < ApplicationController


  def blacklist

    userss = Customer.where(:name => params['name'])
    puts params['userss']
   if params['blacklist'] == '1'
    resp = userss.update(:blacklist => 'true')
    #response = {message: Message.updated}
    resp1 = "success"
     json_response(["#{resp1}"])
   elsif params['blacklist'] == '0'
    resp = userss.update(:blacklist => 'false')
    resp1 = "success"
     json_response(["#{resp1}"])

   end

  end

  def four
    #Weekly
   # cust = Customer.all.where('created_at BETWEEN ? AND ? ', 1.week.ago.beginning_of_week , 1.week.ago.end_of_week)
    #Daily
    #cust = Customer.all.where('created_at >= ?', Time.zone.now.beginning_of_day)
    #Montly
    #cust = Customer.all.where('created_at BETWEEN ? AND ? ', 1.month.ago.beginning_of_month , 1.month.ago.end_of_month)

    # Recently Visited Customers

    cust = Customer.all.order('position_changed DESC').limit('4')
    json_response(cust)

  end



  # GET /customers
  def index
    #@customers = Customer.all
    json_response(Customer.all)
  end

  # POST /customers
  def create
    @customer = Customer.create!(customer_params)
    json_response(@customer, :created)
  end

  # GET /customers/:id
  def show
    json_response(Customer.find(params[:id]))
  end

  # PUT /customers/:id
  def update
    @customer.update(customer_params)
    head :no_content
  end

  # DELETE /customers/:id
  def destroy

    @customer.destroy
    head :no_content
  end



  private

#  def set
 #   @i = 0
 # end

  def customer_params
    # whitelist params
    params.permit(:name, :age, :gender, :history, :avatar)
  end

  def blacklist_params
    params.permit(:name, :blacklist, :id)
  end

  #def set_customer
   # @customer = Customer.find(params[:id])
  #end

end
