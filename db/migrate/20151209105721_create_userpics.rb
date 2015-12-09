class CreateUserpics < ActiveRecord::Migration
  def change
    create_table :userpics do |t|

      t.timestamps null: false
    end
  end
end
