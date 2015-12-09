class CreateSavedplaces < ActiveRecord::Migration
  def change
    create_table :savedplaces do |t|
      t.references :place, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :usertag, index: true, foreign_key: true
      t.references :usertip, index: true, foreign_key: true
      t.references :userpic, index: true, foreign_key: true
      t.string :headline

      t.timestamps null: false
    end
  end
end
