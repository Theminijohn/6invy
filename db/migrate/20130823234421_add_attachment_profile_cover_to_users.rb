class AddAttachmentProfileCoverToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :profile_cover
    end
  end

  def self.down
    drop_attached_file :users, :profile_cover
  end
end
