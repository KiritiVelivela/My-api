class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :gender, :history, :avatar_url, :blacklist
  has_many :trajects
  has_many :blacklisted_customers
  has_many :emotions
  has_many :orders
  has_many :faces
end
