class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(params.require(:room).permit(:image, :name_of_hotel, :introduction, :price, :address))
    if @room.save
      flash[:success] = "施設が作成されました"
      redirect_to @room
    else
      #logger.debug @room.errors.full_messages
      render new_room
    end
  end

  def show
    @user = current_user
    @room = Room.find(params[:id])
  end

  def edit
    @user = current_user
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update (params.require(:room).permit(:image, :name_of_hotel, :introduction, :price, :created_at, :address))
      flash[:notice] = "「#{@room.name_of_hotel}」の情報を更新しました"
    redirect_to @room
    else
      render edit_room
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "施設を削除しました"
    redirect_to :rooms
  end

  def own
    #rooms.allかroom.allか確認したい
    @rooms=current_user.rooms.all
  end
end
