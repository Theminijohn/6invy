class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.string :title

      t.timestamps
    end
  end
end
