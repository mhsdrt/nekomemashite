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
          resources :cats
          resources :comments
          resources :comment_notifications
          resources :likes
          resources :like_notifications
          resources :members
          resources :posts
        end
          get "/about" => "public/homes#about", as: "about"
          root to: "public/homes#top"
end
