class AddAttachmentImageToUserpics < ActiveRecord::Migration
  def self.up
    change_table :userpics do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :userpics, :image
  end
end
