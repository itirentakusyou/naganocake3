Rails.application.routes.draw do

  
  root to: 'public/homes#top'
  get "homes/about" => "homes#about", as: "about"
  devise_for :admins
  devise_for :customers
  
  
 
 #顧客 
  scope module: :public do
     resources :items, only: [:index, :show]
     resources :cart_item, only: [:new, :create, :index, :show, :destroy]
      delete "cart_items/destroy_all" => "cart_items#destroy_all"
  
  
  resources :orders, only: [:new, :create, :index, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/thanks" => "orders#thanks"
 
  
  resources :addresses, only: [:create, :index, :edit, :update, :destroy]
    
  end
  

   #管理者
   namespace :admin do
     resources :items, only: [:index, :show, :new, :create, :update, :edit]
     resources :genres, only: [:index, :create, :update, :edit]
     resources :customers, only: [:index, :show, :update, :edit]
     resources :orders, only: [:update, :show]
   end

   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end

