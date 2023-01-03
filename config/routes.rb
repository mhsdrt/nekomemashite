Rails.application.routes.draw do
  devise_for :members,skip: [:passwords],  controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
    namespace :admin do
          root "homes#top"
          resources :homes
          resources :cats
          resources :comments
          resources :comment_notifications
          resources :likes
          resources :like_notifications
          resources :members
          resources :posts
        end
        
    namespace :public do
          resources :homes
          resources :cats, only: [:new, :create, :index, :show, :edit, :update, :destroy]
          resources :comments
          resources :comment_notifications
          resources :likes
          resources :like_notifications
          resources :members
          resources :posts, only: [:new, :create, :index, :show, :destroy]
        end
          get "/about" => "public/homes#about", as: "about"
          get "/members/my_page" => "public/members#show"
          root to: "public/homes#top"
          get "search_post" => "posts#search_post"
          
          devise_scope :member do
          post 'members/guest_sign_in' => 'public/sessions#guest_sign_in'
          end
end
