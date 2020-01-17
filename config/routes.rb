Rails.application.routes.draw do
  root 'home#top'
  resources :favorites, only: %i(create destroy)
  resources :sessions, only: %i(new create destroy)
  resources :users do
    member do
      get :likes
    end
  end
  resources :pictures
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
