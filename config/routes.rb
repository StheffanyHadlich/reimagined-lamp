Rails.application.routes.draw do
  get 'users' => 'users#index'
  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  get 'users/:id' => 'users#show', as: :user
  post 'users' => 'users#create'
  put 'users/:id' => 'users#update'
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
