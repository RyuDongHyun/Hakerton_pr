Rails.application.routes.draw do

  resources :posts
  get 'signing/:id/sign_up'=> 'signing#sign_up'
  get 'crews/mypage'
  get 'signing/:id/follow' => 'signing#follow'
  get 'signing/:id/unfollow' => 'signing#unfollow'
  get 'signing/:id/ok' => 'signing#ok'
  get 'crews/:id/mysign' => 'crews#mysign'

  root 'home#index'

  resources :crews
  devise_for :users
  
end
