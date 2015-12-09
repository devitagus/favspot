class CreateCollectedplaces < ActiveRecord::Migration
  def change
    create_table :collectedplaces do |t|
      t.references :savedplace, index: true, foreign_key: true
      t.references :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
