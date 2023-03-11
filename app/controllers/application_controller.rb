class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  #deviseをインストールすることで使えるストロングパラメータに該当する機能。
  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
    added_attrs = [:name, :email, :password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    "/user/#{current_user.id}"
  end

end

