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
    get '/end_users/index' => 'end_users#index'
    get '/end_users/:id/information/edit' => 'end_users#edit', as: 'end_users_information_edit'
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
    get "search" => "searches#search"
  end
  
  #管理者
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    get 'show/:recruitment_id' => 'homes#show', as: 'show'
    resources :homes, only: [:show, :destroy]
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :mahjong_hands, only: [:new, :index, :show, :edit, :create, :update, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end
  
  #ゲストユーザーログイン
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end