class AddFacebookLinkToShows < ActiveRecord::Migration
  def change
    add_column :shows, :facebook_link, :string
  end
end
