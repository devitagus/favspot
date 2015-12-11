class AddPhotosPlaces < ActiveRecord::Migration
  def change
    add_column :places, :photos, :string
  end
end
