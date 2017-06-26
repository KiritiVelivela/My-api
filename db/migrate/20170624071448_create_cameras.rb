class CreateCameras < ActiveRecord::Migration[5.1]
  def change
    create_table :cameras do |t|
      t.string :name

      t.timestamps
    end
  end
end
