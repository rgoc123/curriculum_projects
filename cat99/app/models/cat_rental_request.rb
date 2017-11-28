# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING) }, presence: true
  
  validate :overlapping_approved_requests
  
  belongs_to :cat
  
  private
  
  def overlapping_requests
    rentals = self.cat.cat_rental_requests.reject { |rental| rental.id == self.id }
    rentals.select { |rental| !(rental.start_date > self.end_date || rental.end_date < self.start_date) }
  end
  
  def overlapping_approved_requests
    overlapping_requests.any? { |request| request.status == 'APPROVED' }
  end
end
