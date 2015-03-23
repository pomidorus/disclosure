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

  def short_name
    full_name.split(' ')[0]
  end

  def name_initials
    "#{full_name.split(' ')[1][0]}.#{full_name.split(' ')[2][0]}."
  end
end
