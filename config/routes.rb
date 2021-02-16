Rails
  .application
  .routes
  .draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Chris called his root controller "main", and used the index method
  # I like "show" here, reserving index for list views. But idk 🤷‍♀️
  root to: "home#show" # get "/" also works instead of the root helper
  get "about", to: "about#index"

  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"
  delete "signout", to: "sessions#destroy"

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"
end
