class UsersController < ApplicationController

	before_filter :authenticate_user!, except: [:show]

  def show
		@user = User.find_by_user_name(params[:id])  # For Name instead of ID
		@clips = @user.clips
  end
end
