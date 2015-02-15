class Income < ActiveRecord::Base
  monetize :amount_kopiyok
  belongs_to :finance_disclosure

  def to_s
    "Доход #{amount}"
  end
end
