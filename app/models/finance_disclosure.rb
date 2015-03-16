# == Schema Information
#
# Table name: finance_disclosures
#
#  id         :integer          not null, primary key
#  submitted  :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  year       :integer
#

class FinanceDisclosure < ActiveRecord::Base
  has_one :person
  has_many :properties

  has_many :incomes
  accepts_nested_attributes_for :incomes

  def to_s
    "Декларация  #{submitted}"
  end
end
