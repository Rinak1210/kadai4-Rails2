class ReservationsController < ApplicationController
  
  #予約済み一覧
  def index
  end

  #予約直前の内容の確認
  def new
    @room = Room.find(params[:room_id])#登録されたルームidを探し出す
    @checkin_date = params[:checkin_date]
    @checkout_date = params[:checkout_date]
    @length_of_stay = @checkout_date.to_i - @checkin_date.to_i #ここを調べておく！
    @number_of_people = params[:number_of_people]
    @amount_of_price = @length_of_stay * @room.price
  end

  def create #予約確定ボタン先
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:room_id, :checkin_date, :checkout_date,:number_of_people))
    if @reservation.save
      flash[:success] = "施設が作成されました"
      redirect_to @reservation
    else
      render new_reservation
    end
  end
  end

  def show  
  end

  def edit
  end

  def update
  end

  def destroy
  end

