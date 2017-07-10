class Customer < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  has_many :trajects, dependent: :destroy
  has_many :blacklisted_customers, dependent: :destroy
 # has_many :emotions, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :faces, dependent: :destroy

 # validates_presence_of :name, :gender, :age, :history, :avatar


  def avatar_url
    "http://192.168.0.2:3000"+"#{avatar.url}"
  end




end
