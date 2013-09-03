Vinerity::Application.routes.draw do

	root :to => 'clips#index'

  resources :clips

  resources :shows


  get "users/show"

	get 'getstarted/welcome' => 'get_started#welcome'

	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
																			 :registrations => "registrations"},
						 :path => '', :path_names => {:sign_in => 'login'} # Redirect from users/sign_in to /signin

	get '/:id' => 'users#show', as: :user

  get "flatuipro_demo/index"


	get '/404', :to => 'errors#not_found'
	get '/422', :to => 'errors#server_error'
	get '/500', :to => 'errors#server_error'





end
