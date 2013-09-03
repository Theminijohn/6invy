class RegistrationsController < Devise::RegistrationsController

	def update
		# required for settings form to submit when password is left blank
		if params[:user][:password].blank?
			params[:user].delete("password")
			params[:user].delete("password_confirmation")
		end

		@user = User.find(current_user.id)
		if @user.update_attributes(account_update_params)
			set_flash_message :notice, :updated
			# Sign in the user bypassing validation in case his password changed
			sign_in @user, :bypass => true
			redirect_to after_update_path_for(@user)
		else
			render "edit"
		end
	end

	def after_sign_up_path_for(resource)
		'/getstarted/welcome'
	end
end