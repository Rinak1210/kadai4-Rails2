class RoomsController < ApplicationController
  def index
    @rooms=Room.all
  end

  def new
    @room = Room.new
  end

  def create
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def own
  end
end
