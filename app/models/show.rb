class Show < ActiveRecord::Base

	belongs_to :user

	validates :name, :presence => true, :uniqueness => true, length: { maximum: 25 }
	validates :announcement, length: { maximum: 140 }
	validates :show_title, length: { maximum: 70 }

	# Show Cover
	has_attached_file :cover, styles: { show_cover: "870x150#"},
										:default_url => "https://s3.amazonaws.com/6invy/new+folder/Assets/Missing-Images/870x150-show-cover-missing+-+Kopie.PNG"

	validates_attachment :cover,
											 content_type: { content_type: ['image/jpeg', 'image/jpg',
																											'image/png'] },
											 size: { less_than: 5.megabytes }

	# Show Avatar
	has_attached_file :avatar, styles: { avatar: "256x256#"},
										:default_url => "https://s3.amazonaws.com/6invy/new+folder/Assets/Missing-Images/show-avatar-missing.png"

	validates_attachment :avatar,
											 content_type: { content_type: ['image/jpeg', 'image/jpg',
																											'image/png'] },
											 size: { less_than: 5.megabytes }


	def to_param
		name
	end

	def name=(value)
		write_attribute(:name, value.gsub(/\s+/, ""))
	end

end
