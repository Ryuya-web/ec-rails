Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  scope module: :public do
    root to: "homes#top"
    resources :end_users
    resources :addresses
    get 'end_users/:id/confirm' => 'end_users#confirm', as: 'end_user_confirm'
    put "/end_users/:id/hide" => "end_users#hide", as: 'end_user_hide'
    resources :items
    post 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
    post 'orders/finish' => 'orders#finish', as: 'order_finish'
    delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
    resources :cart_items,only: [:destroy,:update,:index,:create]
    resources :orders, only: [:index, :new, :show] 
  end
  namespace :admin do
    get 'top', to: 'homes#top'
    resources :end_users
    resources :genres
    resources :items
    resources :orders
    resources :order_details
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
