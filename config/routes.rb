Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated do
      root to: 'posts#index', as: 'authenticated_root'
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  get   '/posts', to: 'posts#index', as: 'posts'
  
  resources :trackable_users, only: [:index, :create, :destroy]
end
