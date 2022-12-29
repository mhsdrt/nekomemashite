class Like < ApplicationRecord
  belongs_to :member
  belongs_to :post
  has_many :like_notifications, dependent: :destroy
end