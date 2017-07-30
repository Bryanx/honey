Rails.application.routes.draw do

  get 'contacts/delete'

  get 'contacts/edit'

  root 'contacts#index'

  get 'contacts/show'

  get 'contacts/new'

  root 'contacts#index'

  get 'contacts/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/new'
  get '/signup' => 'users#new'
  resources :users

  get 'sessions/new'
  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/contacts' => 'contacts#index', as: :contacts
  get 'contacts/new' => 'contacts#new'
  post 'contacts' => 'contacts#create'
  get 'contacts/:id' => 'contacts#show', as: :contact
  get 'contacts/:id/edit' => 'contacts#edit', as: :edit_contacts
  patch 'contacts/:id' => 'contacts#update'
  delete 'contacts/:id/delete' => 'contacts#destroy', as: :delete_contacts



end
