Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  devise_for :users
  resources :boards do
    resources :embeds
    resources :memberships, except: :show do
      get 'search', on: :collection
    end
  end

  root to: 'home#index'

  scope :users do
    resource :profile, only: %i[edit update]
  end

  get "/notifications", to: "notifications#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
