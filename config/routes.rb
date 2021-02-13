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
end
