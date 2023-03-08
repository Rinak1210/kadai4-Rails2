#class UsersController < ApplicationController
  #def edit
    #user = User.find(params[:id])
    #@image = user.image
  #end

  #def update
    #if current_user.update(user_params)
      #redirect_to user_path(current_user)
    #else
      #render :edit
    #end
  #end

  #def show
    #user = User.find(params[:id])
    #@id = user.id
    #@name = user.name
    #@image = user.image
    #@profile = user.profile
    #@videos = user.videos.order("created_at DESC")
  #end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :image, :profile)
  end
end
