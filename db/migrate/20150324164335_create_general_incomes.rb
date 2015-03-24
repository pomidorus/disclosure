class CreateGeneralIncomes < ActiveRecord::Migration
  def change
    create_table :general_incomes do |t|
      t.integer :amount_hryvna
      t.integer :finance_disclosure_id

      t.timestamps null: false
    end
    add_index :general_incomes, :finance_disclosure_id
  end
end
