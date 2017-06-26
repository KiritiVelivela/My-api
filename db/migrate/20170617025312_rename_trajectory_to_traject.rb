class RenameTrajectoryToTraject < ActiveRecord::Migration[5.1]
  def change
    rename_table :trajectories, :trajects
  end
end
