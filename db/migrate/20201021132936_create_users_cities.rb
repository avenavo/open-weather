class CreateUsersCities < ActiveRecord::Migration[6.0]
  def change
    create_table :users_cities do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :city, null: false, foreign_key: true
      t.timestamps
    end
  end
end
