Rails.application.routes.draw do

  # ログイン、アカウント編集後、任意のページに推移させるための記述
  devise_for :users, controllers: { registrations: 'users/registrations' }
  #:sessions => 'users/sessions'}
get "users/show" => "users#show"
  

  #サインアップページ「/users/sign_up」でエラーが発生した場合、「/users」にリダイレクトされてしまいます。
  #そのまま登録するとルーティングエラーが表示されます。
  #これを回避するために、「devise_scope :users」以下の記述を追記して、任意のルーティングをさせています。
  devise_scope :user do
    get "/users", to: redirect("/users/sign_up")
  end

  namespace 'users' do
    resource :account, only: :show
    resource :profile, only: :show
  end

  get "reservations/confirm" => "reservations#show"
  resources :reservations

  resources :rooms do
    get :own, on: :collection
  end

  #resources :users
  root to: "home#index"
end
