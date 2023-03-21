class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @user = current_user
    # current_userは現在ログインしているユーザーのこと
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    #findメソッドとparamsメソッドでUserモデルから対象のユーザー情報のレコードを読込
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
