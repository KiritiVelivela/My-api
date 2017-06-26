class CreateFaces < ActiveRecord::Migration[5.1]
  def change
    create_table :faces do |t|
      t.string :image_pathname
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
