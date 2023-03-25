class Favorite < ApplicationRecord
  belongs_to :end_user
  belongs_to :recruitment
  
  validates_uniqueness_of :recruitment_id, scope: :end_user_id
end
