class Reply < ApplicationRecord
  belongs_to :end_user
  belongs_to :recruitment
  
  validates :comment,presence:true
end
