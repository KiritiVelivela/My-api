class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.float :price
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
