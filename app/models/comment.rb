class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post
  has_many :comment_notifications, dependent: :destroy
  
    validates :comment, presence: true
end
