class AddSlugToCityCouncil < ActiveRecord::Migration
  def change
    add_column :city_councils, :slug, :string
    add_index :city_councils, :slug
  end
end
