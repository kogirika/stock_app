Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    member do
      get "updown"
    end
  end
  
end
