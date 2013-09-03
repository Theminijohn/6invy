class AddAttachmentAvatarToShows < ActiveRecord::Migration
  def self.up
    change_table :shows do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :shows, :avatar
  end
end
