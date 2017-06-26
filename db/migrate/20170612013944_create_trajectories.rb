class CreateTrajectories < ActiveRecord::Migration[5.1]
  def change
    create_table :trajectories do |t|
      t.string :trajectory
      t.references :customer, foreign_key: true
      t.string :position
      t.timestamps
    end
  end
end
