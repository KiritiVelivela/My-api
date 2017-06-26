class CreateBlacklistedCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :blacklisted_customers do |t|
      t.boolean :blacklisted
      t.string :reason
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
