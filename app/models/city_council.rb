# == Schema Information
#
# Table name: city_councils
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CityCouncil < ActiveRecord::Base
  has_many :officials

  validates :slug, uniqueness: true, presence: true
  validates_presence_of :name
  before_validation :generate_slug

  def to_s
    short_name
  end

  def to_param
    slug
  end

  def short_name
    name.split(' ')[0]
  end

  def generate_slug
    self.slug ||= name.to_slug.transliterate(:ukrainian).to_s.downcase.parameterize
  end

  def officials_disclosures
    officials.joins(:finance_disclosures)
  end
end
