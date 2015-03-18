class AddCouncilToOfficial < ActiveRecord::Migration
  def change
    add_column :officials, :city_council_id, :integer
    add_index :officials, :city_council_id
  end
end
