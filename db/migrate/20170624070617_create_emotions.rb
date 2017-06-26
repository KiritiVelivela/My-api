class CreateEmotions < ActiveRecord::Migration[5.1]
  def change
    create_table :emotions do |t|
      t.string :emotion
      t.timestamp :frame
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
