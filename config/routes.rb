MoodyOn::Application.routes.draw do

  match '/about', :to => "static_pages#about"
  match '/blog', :to => "static_pages#blog"
  match '/developers', :to => "static_pages#developers"
  match '/jobs', :to => "static_pages#jobs"
  match '/privacy', :to => "static_pages#privacy"
  match '/terms', :to => "static_pages#terms"
  match '/contact', :to => "static_pages#contact"
  match '/help', :to => "static_pages#help"
  
 
  match "profile" => "home#profile"
  match "new_profile" => "home#new_profile"
  
  
  authenticated :user do
    resources :events
    resources :reasons
    
    resources :moods 
      resources :sub_moods
    
    match "show_sub_moods/:id" => "home#show_sub_moods"
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end