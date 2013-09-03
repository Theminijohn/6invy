class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable,
				 :omniauth_providers => [:facebook, :twitter]

	attr_accessor :just_signed_up


	# Facebook Settings
	def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
		user = User.where(provider: auth.provider, uid: auth.uid).first
		if user.present?
			user
		else
			user = User.create(first_name:auth.extra.raw_info.first_name,
												 last_name:auth.extra.raw_info.last_name,
												 facebook_link:auth.extra.raw_info.link,
												 user_name:auth.extra.raw_info.name,
												 provider:auth.provider,
												 uid:auth.uid,
												 email:auth.info.email,
												 password:Devise.friendly_token[0,20])
			user.just_signed_up = true
			user
		end
	end



	validates :first_name, :presence => true
	# allow email blank for first create
	validates :email, :presence => true
	validates :user_name, :presence => true, :uniqueness => true

	has_many :clips, dependent: :destroy
	has_one :show, dependent: :destroy

	# Profile Page Avatar
	has_attached_file :avatar, styles: { avatar: "64x64#"},
										:default_url => "https://s3.amazonaws.com/6invy/new+folder/Assets/Missing-Images/64x64-profile-avatar-missing.PNG"

	validates_attachment :avatar,
											 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
											 size: { less_than: 5.megabytes }

	# Profile Page Cover
	has_attached_file :profile_cover, styles: { cover: "870x150#"},
										:default_url => "https://s3.amazonaws.com/6invy/new+folder/Assets/Missing-Images/870x150-profile-cover-missing.PNG"

	validates_attachment :profile_cover,
											 content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
											 size: { less_than: 5.megabytes }


	# For Using the username instead of ID in the Link
	def to_param
		user_name
	end

	def user_name=(value)
		write_attribute(:user_name, value.gsub(/\s+/, ""))
	end


end
