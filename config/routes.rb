Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'top#index'

  resources 'users', only: %I[] do
    resources 'posts', only: %I[create update]
  end
end
