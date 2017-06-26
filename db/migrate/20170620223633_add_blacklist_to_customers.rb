class AddBlacklistToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :blacklist, :boolean
  end
end
