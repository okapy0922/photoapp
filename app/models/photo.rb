class Photo < ActiveRecord::Base
  mount_uploader :img, ImgUploader
  validates :content, presence: true
  validates :img, presence: true
  belongs_to :user
end
