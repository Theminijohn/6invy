class HelpController < ApplicationController

	def home
		@user = User.find_by_user_name(params[:id])  # For Name instead of ID
	end

	def shows
		@user = User.find_by_user_name(params[:id])  # For Name instead of ID
	end

	def profile
		@user = User.find_by_user_name(params[:id])  # For Name instead of ID
	end

	def clips
		@user = User.find_by_user_name(params[:id])  # For Name instead of ID
	end

end
