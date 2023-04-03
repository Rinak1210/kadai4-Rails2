class Users::ProfilesController < ApplicationController
  
  def show
  end

  def edit
  end

  def update
    #currnt_userにattributesは
    @user = current_user
    @user.attributes
    
    if @user.update(profile_params)
      flash[:success] = "プロフィールを更新しました!"
      redirect_to @user
    else
      render :edit
    end
  end

  private

def profile_params
  params.require(:resertion).permit(:image, :name, :introduction)
end

end
