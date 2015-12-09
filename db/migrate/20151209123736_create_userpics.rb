class CreateUserpics < ActiveRecord::Migration
  def change
    create_table :userpics do |t|
      t.references :savedplace, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
