class GardenStep < ApplicationRecord
  belongs_to :step
  belongs_to :garden
  has_many :tasks, through: :step
end
