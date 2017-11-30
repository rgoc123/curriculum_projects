# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  regular    :boolean          default(TRUE), not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :ord, presence: true
  validates :regular, inclusion: [true, false]
  validates :ord, uniqueness: true

  belongs_to :album,
    foreign_key: :album_id,
    class_name: 'Album'
end
