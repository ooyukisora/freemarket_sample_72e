Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root "users#index"
  resources :users, only: :show do
    collection do
      get 'logout'
    end
  end
  resources :cards, only: [:new, :show, :index] do
    collection do
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

    
    delete 'items/:id' => 'items#destroy'
  resources :users, only: [:show]
  resources :items do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'confilm/:id', to: 'items#confilm'
    end
    resources :comments, only: :create
    
    member do
      delete 'favoraites' => "favorites#destroy"
    end
    resources :favorites, only: [:create]
  end
  
  resources :category, only: [:index]

  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end

  end
  
end
