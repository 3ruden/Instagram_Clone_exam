class Picture < ApplicationRecord
  validates :image, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
end
