class CreateUsertags < ActiveRecord::Migration
  def change
    create_table :usertags do |t|
      t.string :tag
      t.references :savedplace, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
