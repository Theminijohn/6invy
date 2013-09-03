class AddShowTitleToShows < ActiveRecord::Migration
  def change
    add_column :shows, :show_title, :string
  end
end
