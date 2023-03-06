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
    resources :recruitments, only: [:new, :index, :show, :edit]
  end
  
  #管理者
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  
  
  namespace :admin do
    get 'end_users/index'
    get 'end_users/show'
    get 'end_users/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'mahjong_hands/new'
    get 'mahjong_hands/index'
    get 'mahjong_hands/show'
    get 'mahjong_hands/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'end_users/show'
    get 'end_users/edit'
  end
  #namespace :public do
    #get 'scorings/index'
    #get 'scorings/show'
  #end
  #namespace :public do
    #get 'mahjong_hands/index'
    #get 'mahjong_hands/show'
  #end
  #namespace :public do
    #get 'recruitments/new'
    #get 'recruitments/index'
    #get 'recruitments/show'
    #get 'recruitments/edit'
  #end
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
