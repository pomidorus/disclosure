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

  validates_presence_of :name

  def short_name
    name.split(' ')[0]
  end

  def to_s
    name
  end

  def officials_disclosures
    officials.joins(:finance_disclosures)
  end
end
