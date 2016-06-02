Rails.application.routes.draw do

	get 'photos/index'
	get 'photos/new'
	get 'photos/create'
	get 'photos/destroy'

  get 'sessions/new'

  get 'users/new'

  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'

  get 'documents' => 'static_pages#documents'
  get 'new_file' => 'photos#new'
  get 'files_index' => 'photos#index'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users
  resources :photos, only: [:new, :create, :index, :destroy]
end