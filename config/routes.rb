Rails.application.routes.draw do
  get 'posts/search_book'
  post 'posts/searching' => 'posts#searching'
  
  get 'posts/show_book'
  
  get 'signing/:id/sign_up'=> 'signing#sign_up'
  get 'crews/mypage'
  get 'signing/:id/follow' => 'signing#follow'
  get 'signing/:id/unfollow' => 'signing#unfollow'
  post 'signing' => 'signing#ok'
  get 'crews/:id/mysign' => 'crews#mysign'
  
 

  root 'home#index'
  
  resources :posts
  resources :crews
  devise_for :users
  
end
