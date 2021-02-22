Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spots, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:show, :new, :create] do
      resources :spottings, only: [:new, :create]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
