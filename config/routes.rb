Rails.application.routes.draw do
  #ユーザー
  # URL /end_users/sign_in ...
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get '/end_users/information/edit' => 'end_users#edit'
    patch '/end_users/information' => 'end_users#update'
    get '/end_users/my_page' => 'end_users#show'
    get '/end_users/unsubscribe' => 'end_users#unsubscribe'
    patch '/end_users/withdraw' => 'end_users#withdraw'
    resources :scorings, only: [:index, :show]
    resources :mahjong_hands, only: [:index, :show]
    resources :recruitments do
      resource :favorites,only: [:create, :destroy]
      resources :replies,only: [:create, :destroy]
    end
  end
  
  #管理者
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :mahjong_hands, only: [:new, :index, :show, :edit, :create, :update]
    resources :genres, only: [:index, :edit, :create, :update]
  end
  
  #ゲストログイン
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end