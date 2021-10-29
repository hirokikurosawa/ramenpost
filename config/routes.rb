Rails.application.routes.draw do
  namespace :users do
    get 'likes/index'
    get 'likes/creat'
    get 'likes/destroy'
  end
  namespace :users do
    get 'posts/index'
    get 'posts/new'
    get 'posts/creat'
    get 'posts/show'
    get 'posts/destroy'
    get 'posts/following_posts'
    get 'posts/search'
  end
  namespace :users do
    get 'users/show'
    get 'users/check'
    get 'users/destroy'
  end
  namespace :users do
    get 'hoems/top'
    get 'hoems/about'
  end
  namespace :admins do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admins do
    get 'homes/top'
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
