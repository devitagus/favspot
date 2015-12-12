class ChangeNameTagsSavedplace < ActiveRecord::Migration
  def change
   rename_column :savedplaces, :tags, :tip
  end
end
