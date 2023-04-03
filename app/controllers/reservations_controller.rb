class ReservationsController < ApplicationController
  
  #予約済み一覧
  def index
    @reservations=Reservation.all
  end
  
  #room/showがnewの役割になっているため、new.htmlは必要なし。
  #def new
    #@reservation = current_user.reservations.new(params.require(:reservation).permit(:room_id, :user_id, :checkin_date, :checkout_date, :number_of_people, :length_of_stay, :amount_of_price))
  #end

  def create #room/showからの、予約確定ボタンの先
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      flash[:success] = "予約を完了しました"
      redirect_to reservations_path
    else
      render new_reservation_path
    end
  end

  #def show 
    #@reservation = Reservation.find(params[:id])
  #end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update((reservation_params))
    redirect_to confirm_reservation_path
    else
      render reservations_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to reservations_path
  end

  #予約直前の内容の確認
  def confirm
    @room = Room.find(params[:room_id])#登録されたルームidを探し出す
    @checkin_date = params[:checkin_date]
    @checkout_date = params[:checkout_date]
    @length_of_stay = (@checkout_date.to_date - @checkin_date.to_date).to_i
    @number_of_people = params[:number_of_people]
    @amount_of_price = @length_of_stay.to_i * @room.price.to_i * @number_of_people.to_i
    #カクニンチュウ@reservation = Reservation.find(reservation_params)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :checkin_date, :checkout_date, :number_of_people, :length_of_stay, :amount_of_price)
  end
end
