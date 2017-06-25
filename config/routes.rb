Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'top#index'

  get  'feeds' => 'feeds#index'
  post 'feeds' => 'feeds#index'

  resources 'users', only: %I[] do
    get 'feed'
    resources 'posts', only: %I[create update]
  end
end
