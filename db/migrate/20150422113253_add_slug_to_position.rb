class AddSlugToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :slug, :string
    add_index :positions, :slug
  end
end
