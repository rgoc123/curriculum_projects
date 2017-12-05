# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  author_id  :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#

class Comment < ApplicationRecord
  validates :content, presence: true 
  
  belongs_to :author,
  class_name: :User,
  foreign_key: :author_id
  
  belongs_to :parent,
  class_name: :Comment,
  foreign_key: :parent_id,
  optional: true
  
  has_many :comments,
  class_name: :Comment,
  foreign_key: :parent_id
  
  belongs_to :post
end
