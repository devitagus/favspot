class CreateUsertips < ActiveRecord::Migration
  def change
    create_table :usertips do |t|
      t.string :tip
      t.references :savedplace, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
