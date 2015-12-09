class CreateUsertips < ActiveRecord::Migration
  def change
    create_table :usertips do |t|
      t.string :tip

      t.timestamps null: false
    end
  end
end
