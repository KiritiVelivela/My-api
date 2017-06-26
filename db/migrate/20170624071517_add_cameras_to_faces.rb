class AddCamerasToFaces < ActiveRecord::Migration[5.1]
  def change
    add_reference :faces, :camera, foreign_key: true
  end
end
