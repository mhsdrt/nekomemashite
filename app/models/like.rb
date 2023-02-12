class Like < ApplicationRecord
  belongs_to :member
  belongs_to :post
  has_many :like_notifications, dependent: :destroy
  
  validates_uniqueness_of :post_id, scope: :member_id
  
  has_many :like_notifications, dependent: :destroy 
end