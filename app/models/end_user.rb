class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  
  has_many :recruitments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #退会済みのユーザーが同じアカウントでログインできない
  def active_for_authentication?
    super && (is_deleted == false)
  end
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  #ゲストユーザー
  def self.guest
    find_or_create_by!(login_name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.login_name = "guestuser"
    end
  end
  
  #検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @end_users = EndUser.where("login_name LIKE?", "#{word}")
    elsif search == "partial_match"
      @end_users = EndUser.where("login_name LIKE?", "%#{word}%")
    else
      @end_users = EndUser.all
    end
  end

end
