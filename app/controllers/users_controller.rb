class UsersController < ApplicationController


  def show
    @user = current_user
    # current_userは現在ログインしているユーザーのこと
  end
end
