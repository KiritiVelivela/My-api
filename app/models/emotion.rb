class Emotion < ApplicationRecord

 # mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  #validates :emotion, presence: true

  belongs_to :customer

  #def url
   # "http://10.0.2.2:3000"+"#{attachment.url}"
  #end

  #def error
   # "false"
  #end






end
