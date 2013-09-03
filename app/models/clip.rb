class Clip < ActiveRecord::Base

	validates :title, :presence => true
	validates :user_id, presence: true

	# Validation for presence either THIS or THAT
	validates :vine_link, :presence => true, :if => Proc.new {instagram_link.blank?}
	validates :instagram_link, :presence => true, :if => Proc.new {vine_link.blank?}

	belongs_to :user

	def to_param
		"#{id}-#{title.parameterize}"
	end

end
