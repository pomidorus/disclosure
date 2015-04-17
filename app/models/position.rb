# == Schema Information
#
# Table name: positions
#
#  id         :integer          not null, primary key
#  short      :string
#  full       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Position < ActiveRecord::Base
  has_many :persons, through: :officials
  has_many :officials

  validates_presence_of :full

  def to_s
    full
  end
end
