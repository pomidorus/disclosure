class CreateFinanceDisclosures < ActiveRecord::Migration
  def change
    create_table :finance_disclosures do |t|
      t.date :submitted

      t.timestamps null: false
    end
  end
end
