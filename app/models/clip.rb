class Clip < ActiveRecord::Base

	validates :title, :presence => true
	validates :user_id, presence: true

	# Validation for presence either THIS or THAT
	validates :vine_link, :presence => true, :if => Proc.new {instagram_link.blank?}
	validates :instagram_link, :presence => true, :if => Proc.new {vine_link.blank?}

	# Polymorphic Associations
	belongs_to :user
	belongs_to :attachable, :polymorphic => true

	extend FriendlyId
	friendly_id :title, use: :slugged

	def should_generate_new_friendly_id?
		new_record?
	end


end
