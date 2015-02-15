class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.monetize :amount
      t.integer  :finance_disclosure_id

      t.timestamps null: false
    end
  end
end
