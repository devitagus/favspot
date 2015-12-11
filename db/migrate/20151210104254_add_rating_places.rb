class AddRatingPlaces < ActiveRecord::Migration
  def change
    add_column :places, :rating, :string
    add_column :places, :phone, :string
  end
end
