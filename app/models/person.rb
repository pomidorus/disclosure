# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  full_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ActiveRecord::Base
  has_many :positions, through: :officials
  has_many :officials

  def city_council
    officials.first.city_council
  end

  #TODO: Decorator
  def short_name
    [full_name.split(' ')[0],name_initials].join(' ')
  end

  #TODO: Decorator
  def name_initials
    "#{full_name.split(' ')[1][0]}.#{full_name.split(' ')[2][0]}."
  end
end
