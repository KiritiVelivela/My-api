class Face < ApplicationRecord
  belongs_to :customer
  has_many :cameras
end
