class AddColTipsSavedplace < ActiveRecord::Migration
  def change
   add_column :savedplaces, :tag, :string
  end
end
