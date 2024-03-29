class Post < ApplicationRecord
  
    belongs_to :member
    belongs_to :cat
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_members, through: :likes, source: :member
    has_one_attached :post_image

    validates :cat_id, presence: true
    validates :post_image, presence: true
    
    
      def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
      end
      

      
end
