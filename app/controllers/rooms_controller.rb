class RoomsController < ApplicationController

  # a way to dry the code and not write @room = Room.find(params[:id])
  # each time
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
  end

  def show

  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room, notice: "Room created!"
    else
      render :new
    end
  end

  def edit
    if @room.update(room_params)
      redirect_to @room, notice: "Room updated!"
    else
      render :edit
    end
  end

  def update

  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type; :accomodate,
                                   :bed_room, :bath_room, :listing_name,
                                   :summary, :address, :is_tv, :is_kitchen,
                                   :is_air, :is_heating, :is_internet, :is_cutlery,
                                   :cacheroute, :price, :active)

    end

end
