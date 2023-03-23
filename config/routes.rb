Rails.application.routes.draw do




  get "homes/about" => "homes#about", as: "about"


# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 #顧客
  scope module: :public do
     resources :items, only: [:index, :show]
     resources :cart_item, only: [:new, :create, :index, :show, :destroy]
      delete "cart_items/destroy_all" => "cart_items#destroy_all"


  resources :orders, only: [:new, :create, :index, :show]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"


  resources :addresses, only: [:create, :index, :edit, :update, :destroy]
   root "homes#top"
  end


   #管理者
   namespace :admin do
     resources :items, only: [:index, :new, :create, :show, :update, :edit]
     resources :genres, only: [:index, :new, :create, :update, :edit]
     resources :customers, only: [:index, :show, :update, :edit]
     resources :orders, only: [:update, :show]
     root  "homes#top"
   end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end

