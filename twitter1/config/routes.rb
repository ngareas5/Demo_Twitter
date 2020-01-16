Rails.application.routes.draw do
   devise_for :users, :controllers => { registrations: 'registrations' }
  resources :tweets do
  	member do
  	put "like" => "tweets#like"
   # put "unlike" => "tweets#downvote"
  end
  resources :comments
  end
  resources :users do
    member do
      get :followings, :followers
    end
end  
namespace :admin do
  resources :tweets do
      member do
       #get "manage" => "tweets#manage"
        get 'manage', :to => 'tweets#manage', :as => :manage
     end
   end
  resources :users
  root 'tweets#index'
  end
  resources :follows 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "tweets#index"
end
