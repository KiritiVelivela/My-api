class Pdf < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  #validates :emotion, presence: true


  def url
    "http://10.0.2.2:3000"+"#{attachment.url}"
  end



end
