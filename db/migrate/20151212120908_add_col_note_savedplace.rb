class AddColNoteSavedplace < ActiveRecord::Migration
  def change
    add_column :savedplaces, :notes, :string
  end
end
