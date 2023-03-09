Rails.application.routes.draw do
  namespace :public do
    get 'searches/search'
  end
  devise_for :members,skip: [:passwords],  controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
    namespace :admin do
          root to: "homes#top"
          resources :homes
          resources :cats
          resources :comment_notifications
          resources :likes
          resources :like_notifications
          resources :members
          resources :posts do
            resources :comments, only: [:destroy]
          end
        end
        
    scope module: :public do
          resources :homes
          resources :cats, only: [:new, :create, :index, :show, :edit, :update, :destroy]
          resources :comment_notifications
          resources :like_notifications
          resources :members do
                        member do
                          get :likes
                              end
                            end
          resources :posts, only: [:new, :create, :index, :show, :destroy] do
            resource :likes, only: [:create, :destroy]
            resources :comments, only: [:create, :destroy]
          end
        end
          get "/about" => "public/homes#about", as: "about"
          get "/members/my_page" => "public/members#show"
          root to: "public/homes#top"
          get '/search', to: 'public/searches#search'
          get "/members/quit" => "public/members#quit"
          get "/members/withdraw" => "public/members#withdraw"
          post "/members/withdraw" => "public/members#withdraw"
          
          devise_scope :member do
          post 'members/guest_sign_in' => 'public/sessions#guest_sign_in'
          end
end
