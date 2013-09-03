class AddInstagramLinkToClips < ActiveRecord::Migration
  def change
    add_column :clips, :instagram_link, :string
  end
end
