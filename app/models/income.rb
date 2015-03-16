# == Schema Information
#
# Table name: incomes
#
#  id                    :integer          not null, primary key
#  amount_kopiyok        :integer          default(0), not null
#  amount_currency       :string           default("UAH"), not null
#  finance_disclosure_id :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Income < ActiveRecord::Base
  monetize :amount_kopiyok
  belongs_to :finance_disclosure

  def to_s
    "Доход #{amount}"
  end
end
