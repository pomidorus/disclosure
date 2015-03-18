class AddOfficialToDisclosure < ActiveRecord::Migration
  def change
    add_column :finance_disclosures, :official_id, :integer
    add_index :finance_disclosures, :official_id
  end
end
