class Post < ApplicationRecord
  
    belongs_to :member
    belongs_to :cat
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_one_attached :image
    
end
