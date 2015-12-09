class CreateGooglepics < ActiveRecord::Migration
  def change
    create_table :googlepics do |t|
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
