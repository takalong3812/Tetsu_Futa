Rails.application.routes.draw do

  root to: "homes#top"


  #エンドユーザー用
  devise_for :users,skip: [:passwords], controller: {
    registration: "user/registrations",
    sessions: "user/sessions"
  }

  #管理者用
  devise_for :admins,skip: [:registration, :passwords], controller: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :user do
   resources :users

   end



end
