Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'public/sessions',
    passwords: 'public/passwords',
    registrations: 'public/registrations'
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
       resources :orders, only: [:show]
       resources :order_details, only: [:update]
   end
   scope module: :public do
     get 'about' => 'homes#about'
     resources :items, only: [:index, :show]
     resources :customer, only: [:show, :edit, :update, :withdraw]
     resources :customer, only: [:show, :edit, :update]
     get 'customers/withdraw' => 'customers#withdraw'
     patch 'customers/withdraw_update' => 'customers#withdsraw_update'
     resources :cart_items, only: [:index, :create, :update, :destroy]
     delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
     resources :orders, only: [:new, :show, :index, :create]
     get 'orders/thanks' => 'orders#thanks'
     post 'orders/verification' => 'orders#verification'
     resources :addresses, only: [:index, :edit, :create, :update, :destroy]
   end
end