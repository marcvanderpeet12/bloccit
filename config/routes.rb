Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/create'

  devise_for :users

  resources :topics do
     resources :posts, except: [:index]
   end
 
   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
   end
  
  resources :users, only: [:update]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
