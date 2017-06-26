class AddPositionchangedToTrajects < ActiveRecord::Migration[5.1]
  def change
    add_column :trajects, :position_changed, :datetime, default: DateTime.now

  end
end
