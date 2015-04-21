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

  has_one :general_income
  accepts_nested_attributes_for :general_income

  has_one :family_general_income
  accepts_nested_attributes_for :family_general_income

  has_many :incomes
  accepts_nested_attributes_for :incomes

  has_many :properties

  validates_presence_of :official_id
  validates_presence_of :general_income

  scope :personal_all_with_council, -> { includes(:general_income).order('general_incomes.amount_hryvna DESC') }
  scope :personal_all, -> { includes(:general_income).order('general_incomes.amount_hryvna DESC') }
  scope :family_all, -> { includes(:family_general_income).order('family_general_incomes.amount_hryvna DESC') }

  def to_s
    "Декларация  #{submitted}"
  end

  def general_income_value
    general_income.amount_hryvna if general_income.present?
  end

  def family_general_income_value
    family_general_income.amount_hryvna if family_general_income.present?
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
