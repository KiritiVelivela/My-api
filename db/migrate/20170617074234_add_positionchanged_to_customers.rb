class AddPositionchangedToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :position_changed, :datetime
  end
end
