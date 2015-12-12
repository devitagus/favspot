class AddColTagsSavedPLaces < ActiveRecord::Migration
  def change
     add_column :savedplaces, :tags, :string
  end
end
