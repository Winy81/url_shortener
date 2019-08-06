Rails.application.routes.draw do

  root to: 'shortened_urls#index'
  post "/shortened_urls/create"
  get "shortened/:short_url", to: "shortened_urls#shortened", as: :shortened

end
