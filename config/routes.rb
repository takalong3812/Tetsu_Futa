Rails.application.routes.draw do

  root to: "homes#top"


  #エンドユーザー用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  #管理者用
  devise_for :admins,skip: [:registration, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :user do
    resources :users
    get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

   end



end
