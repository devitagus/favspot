class CreateUserPlacesCategories < ActiveRecord::Migration
  def change
    create_table :user_places_categories do |t|
      t.references :savedplace, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
