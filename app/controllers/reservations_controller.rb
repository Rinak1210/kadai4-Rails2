class ReservationsController < ApplicationController
  def index
  end

  def new
    room = Room.find(params[:room_id])#登録されたルームidを探し出す
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:room_id, :checkin_date, :checkout_date))
  end

  def create #予約確定ボタン先
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:image, :name_of_hotel, :introduction, :price, :address))
  end

  def show  
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
