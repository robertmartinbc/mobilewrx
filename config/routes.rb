Mobilewrx::Application.routes.draw do



  get "promotions/client_view"

  match "create" => "charges#create", via: :get

  match "new" => "charges#new", via: :get

  match "terms_service" => "home#terms_service", via: :get

  match "privacy_policy" => "home#privacy_policy", via: :get

  get "account/show"

  get "/promotions/view/:id", to: 'promotions#view'

  get "/promotions/client_view/:id", to: 'promotions#client_view'

  resources :charges

  resources :promotions

  resources :purchases

  resources :redemptions

  # resources :redemptions, only: [:create]
  post "/redemptions/:purchase_id", to: "redemptions#create", as: "redemption"

  match "client_subscription" => "home#client_subscription", via: :get

  match "customer_subscription" => "home#customer_subscription", via: :get

  match "subscriptions" => "home#subscriptions", via: :get

  match "promotions" => "home#promotions", via: :get

  match "how" => "home#how", via: :get

  match "faq" => "home#faq", via: :get

  match "about" => "home#about", via: :get

  match "contact" => "home#contact", via: :get

  mount StripeEvent::Engine => '/stripe'
  get "content/gold"
  get "content/silver"
  get "content/platinum"
  get "content/standard"
  get "content/premium"
  get "content/vip"
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
    put 'update_card', :to => 'registrations#update_card'
  end
  resources :users, only: [:show] do
    resources :redemptions, only: [:index, :show], controller: "users/redemptions"
  end
end
