class ChangeCategName < ActiveRecord::Migration
  def change
    rename_column :places, :category, :categories
  end
end
