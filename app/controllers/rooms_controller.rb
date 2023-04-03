class RoomsController < ApplicationController

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
    #カクニンチュウ@reservation = Reservation.find(params.require(:reservation).permit(:room_id, :user_id, :checkin_date, :checkout_date, :number_of_people, :length_of_stay, :amount_of_price))
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
    redirect_to :own_rooms
  end

  def own
    #rooms.allかroom.allか確認したい
    @rooms=current_user.rooms.all
  end

  def search
    @rooms = Room.all
    if params[:address].present?
      @rooms = @rooms.where('address LIKE ?', "%#{params[:address]}%")
    end
    if params[:keyword].present?
        @rooms = @rooms.where('address LIKE ?', "%#{params[:address]}%")
        @rooms = @rooms.where('name_of_hotel LIKE ? or introduction LIKE ?', "%#{params[:keyword]}%","%#{params[:keyword]}%")
    end
  end

end
