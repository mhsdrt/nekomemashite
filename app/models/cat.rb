class Cat < ApplicationRecord
  
  belongs_to :member
  has_many :posts, dependent: :destroy
  has_one_attached :cat_image
  

  
  def get_cat_image(width, height)
  unless cat_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    cat_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  cat_image.variant(resize_to_limit: [width, height]).processed
  end
end

