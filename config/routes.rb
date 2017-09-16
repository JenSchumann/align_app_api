Rails.application.routes.draw do
  # root 'welcome#index'

  resources :plans

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :show, :update] do
    resources :plans, only: [:index, :create, :show, :update, :destroy]
  end


resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
end
