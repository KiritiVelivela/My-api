class AddAttachmentsToEmotions < ActiveRecord::Migration[5.1]
  def change
    add_column :emotions, :attachment, :string
  end
end
