class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.decimal :area

      t.timestamps null: false
    end
  end
end
