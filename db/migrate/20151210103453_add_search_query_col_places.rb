class AddSearchQueryColPlaces < ActiveRecord::Migration
  def change
    add_column :places, :search_query, :string
  end
end
