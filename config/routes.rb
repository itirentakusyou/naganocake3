Rails.application.routes.draw do

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

   root "homes#top" 
   get "/about" => "homes#about", as: "about"


    # 会員
      get "customers/out" => "customers#out" #顧客の退会確認画面
      patch "customers/withdraw" => "customers#withdraw" #顧客の退会処理(ステータスの更新)
      get "customers/my_page" => "customers#show"
      get "customers/information/edit" => "customers#edit"
      patch "customers/information" => "customers#update"

    #商品
     resources :items, only: [:index, :show]

     resources :cart_items, only: [:new, :create, :index, :show, :destroy,:update]
     delete "cart_items/destroy_all" => "cart_items#destroy_all"


   #注文
   get "orders/complete" => "orders#complete"
    resources :orders, only: [:new, :create, :index, :show]
    post "orders/confirm" => "orders#confirm"

   #配送先
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]



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

