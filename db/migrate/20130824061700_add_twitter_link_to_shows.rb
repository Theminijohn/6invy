class AddTwitterLinkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :twitter_link, :string
  end
end
