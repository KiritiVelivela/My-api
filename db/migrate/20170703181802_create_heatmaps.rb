class CreateHeatmaps < ActiveRecord::Migration[5.1]
  def change
    create_table :heatmaps do |t|
      t.date :start_date
      t.date :end_date
      t.string :map

      t.timestamps
    end
  end
end
