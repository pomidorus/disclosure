# == Schema Information
#
# Table name: finance_disclosures
#
#  id          :integer          not null, primary key
#  submitted   :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  year        :integer
#  official_id :integer
#

class FinanceDisclosure < ActiveRecord::Base
  belongs_to :official

  has_one :general_income, class_name: "Income"
  accepts_nested_attributes_for :general_income

  has_many :incomes
  accepts_nested_attributes_for :incomes

  has_many :properties

  validates_presence_of :official_id

  def to_s
    "Декларация  #{submitted}"
  end

  def general_income_value
    general_income.amount_hryvna if general_income.present?
  end

  def official_name
    official.person_short_name if official.present?
  end

  def official_position
    official.position.full if official.present?
  end

  def city_council
    official.city_council if official.present?
  end
end
