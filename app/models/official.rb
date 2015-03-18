# == Schema Information
#
# Table name: officials
#
#  id              :integer          not null, primary key
#  person_id       :integer
#  position_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  city_council_id :integer
#

class Official < ActiveRecord::Base
  belongs_to :person
  belongs_to :position
  belongs_to :city_council

  has_many :finance_disclosures

  def person_name
    person.full_name
  end
end
