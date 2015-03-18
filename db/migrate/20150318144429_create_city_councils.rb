class CreateCityCouncils < ActiveRecord::Migration
  def change
    create_table :city_councils do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
