Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :places do
      resources :bookings
    end

    resources :users, only: [:edit, :show, :update]

    get "/bookings" => "bookings#my_bookings"
end
