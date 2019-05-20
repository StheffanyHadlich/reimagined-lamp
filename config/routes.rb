Rails.application.routes.draw do
  root :to => "users#index"
  resources :users do
    resources :contacts do
      resources :phones
    end
  end
end
