class Garden < ApplicationRecord

  belongs_to :user
  has_many :garden_steps, dependent: :destroy
  has_one_attached :photo
end
