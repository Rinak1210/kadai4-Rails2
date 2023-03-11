Rails.application.routes.draw do
  
  #get 'home/index'
  #get 'users/index'

  #Userモデルを認証用に使う
  devise_for :users#, :controllers => {
    #:registrations => 'users/registrations',
    #:sessions => 'users/sessions'   
  #} 
  

  #サインアップページ「/users/sign_up」でエラーが発生した場合、「/users」にリダイレクトされてしまいます。
  #そのまま登録するとルーティングエラーが表示されます。
  #これを回避するために、「devise_scope :users」以下の記述を追記して、任意のルーティングをさせています。
  devise_scope :user do
    get "/users", to: redirect("/users/sign_up")
    #get "user/:id", :to => "users/registrations#detail"
    #get "signup", :to => "users/registrations#new"
    #get "login", :to => "users/sessions#new"
    #get "logout", :to => "users/sessions#destroy"
  end

  #resources :users
  root to: "home#index"
end
