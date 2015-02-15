class FinanceDisclosure < ActiveRecord::Base
  has_many :incomes
  accepts_nested_attributes_for :incomes

  def to_s
    "Декларация  #{submitted}"
  end
end
