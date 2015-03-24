class FamilyGeneralIncome < ActiveRecord::Base
  belongs_to :finance_disclosure

  def to_s
    "#{amount_hryvna} ₴"
  end
end
