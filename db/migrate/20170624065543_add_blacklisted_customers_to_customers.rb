class AddBlacklistedCustomersToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_reference :customers, :blacklisted_customer, foreign_key: true
  end
end
