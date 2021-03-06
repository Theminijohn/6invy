class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

	# Facebook Callback Action Settings
	def facebook
		# You need to implement the method below in your model (e.g. app/models/user.rb)
		@user ||=
			User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			# This will throw if @user is not activated
			if @user.just_signed_up
				sign_in @user
				redirect_to '/getstarted/welcome'
			else
				sign_in_and_redirect @user, event: :authentication
			end
			if is_navigational_format?
				set_flash_message(:notice, :success, kind: "Facebook")
			end
		else
			session["devise.facebook_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end


	def after_sign_up_path
		'/getstarted/welcome'
	end

end