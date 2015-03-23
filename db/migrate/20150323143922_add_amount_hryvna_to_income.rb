class AddAmountHryvnaToIncome < ActiveRecord::Migration
  def change
    add_column :incomes, :amount_hryvna, :integer, default: 0
  end
end
