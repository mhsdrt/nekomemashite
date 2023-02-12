class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      #member.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      member.name = "ゲスト"
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
    has_many :cats, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :post
    
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
  
end