Rails.application.routes.draw do

  root to: 'shortened_urls#index'
  post "/shortened_urls/create"

end
