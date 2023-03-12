class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :login_name, presence: true, length: { maximum: 20 }
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
