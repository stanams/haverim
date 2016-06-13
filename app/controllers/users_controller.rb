class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms

    @count = 0
    @user.rooms.each do |room|
      @count += room.reviews.count
    end
  end

end
