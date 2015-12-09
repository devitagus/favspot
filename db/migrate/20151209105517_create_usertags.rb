class CreateUsertags < ActiveRecord::Migration
  def change
    create_table :usertags do |t|
      t.string :tag

      t.timestamps null: false
    end
  end
end
