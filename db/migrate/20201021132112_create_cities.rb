class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.integer :external_id, null: false
      t.string :name, null: false
      t.string :country, null: false
      t.timestamps
    end

    add_index :cities, :external_id
  end
end
