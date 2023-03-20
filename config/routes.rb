Rails.application.routes.draw do
  
  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  devise_for :admins
  devise_for :customers
  devise_for :users
  #顧客
  resources :items, only: [:index, :show]
  resources :cart_item, only: [:new, :create, :index, :show, :destroy]do
    delete 'desstroy_all'
  end
  
  resources :orders, only: [:new, :create, :index, :show,]do
    post 'confirm'
    get 'thanks'
  end
  
   resources :addresses, only: [:create, :index, :edit, :uodate, :destroy]
   #管理者
   namespace :admin do
     resources :items, only: [:index, :show, :new, :create, :update, :edit]
     resources :genres, only: [:index, :create, :update, :edit]
     resources :customers, only: [:index, :show, :update, :edit]
     resources :orders, only: [:update, :show]
   end
   
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
