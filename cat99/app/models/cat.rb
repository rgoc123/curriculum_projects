# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  CATCOLORS = %w( orange black white tuxedo tabby calico purple )
  validates :birth_date, :name, :description, presence: true
  validates :sex, inclusion: { in: %w(M F) }
  validates :color, inclusion: { in: CATCOLORS }
  
  def age 
    Time.now.year - self.birth_date.year
  end
  
  has_many :cat_rental_requests,
    foreign_key: :cat_id,
    class_name: 'CatRentalRequest',
    dependent: :destroy
  
end
