class ReservationsController < ApplicationController
  
  #予約済み一覧
  def index
    @reservations= current_user.reservations.all
  end

  def create #room/showからの、予約確定ボタンの先
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      flash[:success] = "予約を完了しました"
      redirect_to reservations_path
    else
      render confirm_reservations_path
      flash[:alert] = "予約に失敗しました"
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:reservation_id])
    if @reservation.update(reservation_params)
    redirect_to reservations_path
    else
      render confirm_reservations_path
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "予約を削除しました"
    redirect_to reservations_path
  end


# 予約直前の内容の確認
def confirm
  # find_or_initialize_byはデータがあればとってくるなければ新しく初期化するというメソッド
  @reservation = current_user.reservations.find_or_initialize_by(id: params[:id])
  # editとnewで分岐させる(すでに作成されているreservationはroomが紐づいているので...)
  if @reservation.room.present?
    room = @reservation.room
  else
    room = Room.find(reservation_params[:room_id])
  end

  # edit newの共通の処理
  @reservation.checkin_date =reservation_params[:checkin_date]
  @reservation.checkout_date =reservation_params[:checkout_date]
  @reservation.number_of_people = reservation_params[:number_of_people].to_i
  # 宿泊日数の計算
  length_of_stay = reservation_params[:checkout_date].to_date - reservation_params[:checkin_date].to_date
  # 宿泊金額の合計計算
  amount_of_price = length_of_stay.to_i * room.price.to_i * reservation_params[:number_of_people].to_i
  @reservation.length_of_stay = length_of_stay
  @reservation.amount_of_price = amount_of_price
end



  private

  def reservation_params
    params.require(:reservation).permit(:room_id, :user_id, :checkin_date, :checkout_date, :number_of_people, :length_of_stay, :amount_of_price)
  end
end
