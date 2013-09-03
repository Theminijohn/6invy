class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:name, :first_name, :user_name, :email, :password, :password_confirmation, :provider, :uid)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:name, :email, :password, :password_confirmation, :first_name, :last_name,
							 :user_name, :avatar, :profile_cover, :facebook_link,
							 :twitter_link, :instagram_link, :status)
		end
	end

	unless Rails.application.config.consider_all_requests_local
		rescue_from Exception,                            :with => :render_error
		rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
		rescue_from ActionController::RoutingError,       :with => :render_not_found
		rescue_from ActionController::UnknownController,  :with => :render_not_found
		rescue_from ActionController::UnknownAction,      :with => :render_not_found
	end

	private
	def render_not_found(exception)
		render :template => "/error/404.html.erb", :status => 404
	end

	def render_error(exception)
		render :template => "/error/500.html.erb", :status => 500
	end


end
