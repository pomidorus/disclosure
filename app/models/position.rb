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
  validates :slug, uniqueness: true, presence: true
  before_validation :generate_slug

  def to_s
    full
  end

  def to_param
    slug
  end

  def generate_slug
    self.slug ||= full.to_slug.transliterate(:ukrainian).to_s.downcase.parameterize
  end
end
