class Traject < ApplicationRecord
  belongs_to :customer

  validates_presence_of :trajectory, :position

end
