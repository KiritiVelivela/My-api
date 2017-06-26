class AddEmotionsToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_reference :customers, :emotions, foreign_key: true
  end
end
