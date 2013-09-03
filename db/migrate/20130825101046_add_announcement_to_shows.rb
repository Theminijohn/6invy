class AddAnnouncementToShows < ActiveRecord::Migration
  def change
    add_column :shows, :announcement, :string
  end
end
