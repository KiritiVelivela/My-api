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



    Customer.create!( :name => 'first lady', :age => 'null', :gender => 'female', :history => 'mixedberry', :avatar => File.open("/home/srilu/Downloads/result2/Customer/11/Face.png"), :traject_id => '1', :blacklist => 'true', :emotions => 'happy', :position_changed => DateTime.now)

    Customer.create!( :name => 'Nurse', :age => '21-32', :gender => 'female', :history => 'Americano', :avatar => File.open("/home/srilu/Downloads/result2/Customer/261/Face.png"), :traject_id => '1', :blacklist => 'false', :emotions => 'neutral', :position_changed => DateTime.now)

      Customer.create!( :name => 'lady in black dress', :age => '21-32', :gender => 'female', :history => 'Mocha', :avatar => File.open("/home/srilu/Downloads/result2/Customer/14/Face.png"), :traject_id => '1', :blacklist => 'false', :emotions => 'neutral', :position_changed => DateTime.now)

      Customer.create!( :name => 'Girl with jacket', :age => '33-59', :gender => 'female', :history => 'Matcha', :avatar => File.open("/home/srilu/Downloads/result2/Customer/528/Face.png"), :traject_id => '1', :blacklist => 'true', :emotions => 'neutral', :position_changed => DateTime.now)

      Customer.create!( :name => 'Nerd guy', :age => 'null', :gender => 'male', :history => 'Latte', :avatar => File.open("/home/srilu/Downloads/result2/Customer/617/Face.png"), :traject_id => '1', :blacklist => 'false', :emotions => 'happy', :position_changed => DateTime.now)

      Customer.create!( :name => 'White shirt guy', :age => '21-32', :gender => 'male', :history => 'Espresso', :avatar => File.open("/home/srilu/Downloads/result2/Customer/320/Face.png"), :traject_id => '1', :blacklist => 'false', :emotions => 'neutral',  :position_changed => DateTime.now)


    if  Customer.count == 18

      up1 = Customer.where(:name => 'Nerd guy')
      up1.update(:emotions => 'neutral')

    elsif Customer.count == 22
      up2 = Customer.where(:name => 'Nerd guy')
      up3 = Customer.where(:name => 'Girl with jacket')

      up2.update(:emotions => 'happy')
      up3.update(:emotions => 'sad')


    elsif Customer.count == 30

          up4 = Customer.where(:name => 'Nerd guy')
          up5 = Customer.where(:name => 'Girl with jacket')

          up4.update(:emotions => 'neutral')
          up5.update(:emotions => 'neutral')


    elsif Customer.count == 34
      up6 = Customer.where(:name => 'Girl with jacket')
      up6.update(:emotions => 'neutral')

    end

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

  def set
    @i = 0
  end

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
