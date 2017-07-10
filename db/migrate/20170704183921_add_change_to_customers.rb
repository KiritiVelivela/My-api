class AddChangeToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :change, :integer
  end
end
