class Album < ActiveRecord::Base

	validates :user_id, presence: true
	validates :name, presence: true

	# Polymorphic Associations
	belongs_to :user
	has_many :clips, :as => :attachable

end
