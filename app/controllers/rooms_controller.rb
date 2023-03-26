class RoomsController < ApplicationController
  def index
    @rooms=Room.all
  end

  def new
    @room = Room.new
  end

  def create
    #ストロングパラメーター＝permitメソッドで保存するパラメーターの許可処理を行ったパラメーター
    @room = Room.new(params.require(:room).permit(:image, :name_of_hotel, :introduction, :price, :created_at))
    if @room.save
      flash[:success] = "施設が作成されました"
      redirect_to :rooms
      #上記は作成した施設詳細へリダイレクトに変更したい。rooms/id(数字)
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
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
    #Active Storageでは、画像ファイルを親子モデルのアソシエーションとして関係付けるため、N+1問題を引き起こす可能性
    #下記スコープで、N+1問題を回避することができます。
    @rooms=Room.all
  end
end
