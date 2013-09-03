class AddUserIdToShows < ActiveRecord::Migration
  def change
    add_column :shows, :user_id, :integer
    add_index :shows, :user_id
  end
end
