Rails3BootstrapDeviseCancan::Application.routes.draw do
	resources :quizzes

	authenticated :user do
		root :to => 'home#index'
	end
	root :to => "home#index"
	devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks", :registrations => "registrations" }
	resources :users
end
