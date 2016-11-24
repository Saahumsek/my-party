Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :places do
      resources :bookings, only: [:new, :create]
    end

    resources :users, only: [:edit, :show, :update]
    resources :bookings, only: [:index, :show]

    #get "/bookings" => "bookings#my_bookings"
    get '/dashboard' => 'bookings#dashboard'
    get '/bookings/:id/accept' => 'bookings#accepted', as: 'accept_booking'
    get '/bookings/:id/reject' => 'bookings#rejected', as: 'reject_booking'
end
