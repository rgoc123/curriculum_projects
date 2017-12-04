class Goal < ApplicationRecord
  validates :user_id, :body, :title, presence: true 
  
  belongs_to :user
end
