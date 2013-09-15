class AddAttachableToClips < ActiveRecord::Migration
  def change
    add_reference :clips, :attachable, polymorphic: true, index: true
  end
end
