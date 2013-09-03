class AddAttachmentCoverToShows < ActiveRecord::Migration
  def self.up
    change_table :shows do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :shows, :cover
  end
end
