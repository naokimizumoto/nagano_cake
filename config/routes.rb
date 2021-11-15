Rails.application.routes.draw do
  scope module: :public do
    get 'customers/edit' => 'customers#edit'
    get 'customers' => 'customers#show'
  end
  devise_for :customers, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'public/passwords'
  }
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root to: 'public/homes#top'
   namespace :admin do
       resources :customers, only: [:index, :show, :edit, :update]
       get 'admin' => 'homes#top'
       resources :items, except: [:destroy]
       resources :genres, only: [:index, :create, :edit, :update]
       resources :orders, only: [:show,:update]
       resources :order_details, only: [:update]
   end
   scope module: :public do
     delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
     resources :cart_items, only: [:index, :create, :update, :destroy]
     get 'about' => 'homes#about'
     resources :items, only: [:index, :show]
    resources :customers, only: [:edit, :show, :update]
     get 'customers/withdraw' => 'customers#withdraw'
     patch 'customers/withdraw_update' => 'customers#withdsraw_update'
     get 'orders/thanks' => 'orders#thanks'
     post 'orders/verification' => 'orders#verification'
     resources :orders, only: [:new, :show, :index, :create]
     resources :addresses, only: [:index, :edit, :create, :update, :destroy]
   end
end
