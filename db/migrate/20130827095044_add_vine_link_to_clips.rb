class AddVineLinkToClips < ActiveRecord::Migration
  def change
    add_column :clips, :vine_link, :string
  end
end
