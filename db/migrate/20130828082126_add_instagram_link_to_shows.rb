class AddInstagramLinkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :instagram_link, :string
  end
end
