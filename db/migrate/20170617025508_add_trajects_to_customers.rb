class AddTrajectsToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_reference :customers, :traject, foreign_key: true
  end
end
