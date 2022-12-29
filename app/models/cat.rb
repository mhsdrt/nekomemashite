class Cat < ApplicationRecord
  
  belongs_to :member
  has_many :posts
  has_one_attached :image
  
    def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no.image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [203, 254]).processed
    end
end

