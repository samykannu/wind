Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles
  resources :categories
  resources :users do
    collection do
        post :login_create
    end
  end
  get 'logout',to: 'users#logout',as: 'logout'
  root 'users#login'
end
