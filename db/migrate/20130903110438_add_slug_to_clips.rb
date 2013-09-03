class AddSlugToClips < ActiveRecord::Migration
  def change
    add_column :clips, :slug, :string
		add_index :clips, :slug
  end
end
