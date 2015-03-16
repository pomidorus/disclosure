class AddYearToDisclosure < ActiveRecord::Migration
  def change
    add_column :finance_disclosures, :year, :integer
  end
end
