Rails.application.routes.draw do
  
  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users#, controllers: { registrations: 'users/registrations' }
  #:sessions => 'users/sessions'}
  root to: "home#index"
  #get "users/show" => "users#show"
  #get "users/edit" => "accounts#edit"
  #get "users/profile/edit" => "profiles#edit"

  #サインアップページ「/users/sign_up」でエラーが発生した場合、「/users」にリダイレクトされるのを防ぐため
  #「devise_scope :users」以下の記述を追記して、任意のルーティングをさせています。
  devise_scope :user do
    get "/users", to: redirect("/users/sign_up")
  end
  
  namespace 'users' do #/users/が前にきます
    resource :account, only: [:show]
    resource :profile, only: [:show, :edit]
  end

  get "reservations/confirm" => "reservations#show"
  resources :reservations

  resources :rooms do
    get :own, on: :collection
  end

end
