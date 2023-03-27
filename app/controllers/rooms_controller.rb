class RoomsController < ApplicationController
  def index
    @rooms=Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:image, :name_of_hotel, :introduction, :price, :address).merge(user_id: current_user.id))
    if @room.save
      flash[:success] = "施設が作成されました"
      redirect_to @room
    else
      logger.debug @room.errors.full_messages
      render "new"
    end
  end

  def show
    #@room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update params.require(:room,).permit(:image, :name_of_hotel, :introduction, :price, :created_at)
    redirect_to @room
  end

  def destroy
  end

  def own
    @rooms=Room.all
  end
end
