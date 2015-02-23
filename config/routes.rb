Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/create'

  devise_for :users
  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create]
    end 
  end
  
  resources :users, only: [:update]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
