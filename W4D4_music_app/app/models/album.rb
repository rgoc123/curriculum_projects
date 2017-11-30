# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  yr         :integer          not null
#  album_type :string           default("live"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :band_id, :title, :yr, presence: true
  validates :studio, inclusion: [true, false]

  belongs_to :band,
    foreign_key: :band_id,
    class_name: 'Band'
end
