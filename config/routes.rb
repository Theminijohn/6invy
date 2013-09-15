Vinerity::Application.routes.draw do

  resources :albums

	root :to => 'clips#index'

  resources :clips
  resources :shows

	# Flat UI Demo Elements
	get "flatuipro_demo/index"

	# Help Desk
	get 'help' => 'help#home'
	get 'help/shows' => 'help#shows'
	get 'help/profile' => 'help#profile'
	get 'help/clips' => 'help#clips'

	get 'getstarted/welcome' => 'get_started#welcome'

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
																			 :registrations => "registrations"},
						 :path => '', :path_names => {:sign_in => 'login'} # Redirect from users/sign_in to /login

	# User Profile
	get "users/show"
	get 'user/:id' => 'users#show', as: :user




end
