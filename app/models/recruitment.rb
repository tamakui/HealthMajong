class Recruitment < ApplicationRecord
    has_one_attached :image
    belongs_to :end_user
    has_many :replies, dependent: :destroy
end
