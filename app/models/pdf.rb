class Pdf < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  #validates :emotion, presence: true


  def url
    "http://192.168.43.147:3000"+"#{attachment.url}"
  end



end
