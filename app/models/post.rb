class Post < ApplicationRecord
  mount_uploader :image, ImagePostUploader
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
