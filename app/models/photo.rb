class Photo < ActiveRecord::Base
  validates :content, presence: true
     validates :img, presence: true
     belongs_to :user
end
