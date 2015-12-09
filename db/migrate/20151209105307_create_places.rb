class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :category
      t.string :googleid

      t.timestamps null: false
    end
  end
end
