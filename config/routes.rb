Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
	root 'home#top'

	namespace :admin do
		resources :blogs, only: [:index, :new, :create, :show, :edit, :update]
	end
	namespace :admin do
    	resources :users, only: [:index, :show, :edit, :update]
	end
	namespace :admin do
    	resources :genres, only: [:index, :create, :edit, :update]
	end
	namespace :admin do
    	root 'home#top'
	end

	get 'home/about'
	devise_for :admins
	devise_for :users

	resources :blogs, only: [:index, :show, :edit, :new, :create]
	resources :users, only: [:index, :show, :edit, :update] do
		resource :favorites, only: [:create, :destroy]
    	resource :book_comments, only: [:create]
    end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
