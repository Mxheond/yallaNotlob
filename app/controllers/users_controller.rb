class UsersController < ApplicationController
#listing all users
  
  def index
    # @users = User.all # getting all the users!
    # @users = User.paginate(:page => params[:page])
    if user_signed_in? 

      @user = User.find(current_user.id)
      @friends = Friend.where("user_id = ?", current_user.id)
      @user_friends = []
      @friends.each do |friend| 
        @id = friend.friend_id
        @user_friends << User.find_by(id: @id)
    end
      @orders = Order.last(4)
    else
      redirect_to new_user_session_url
    end
      # @users = User.all
 
  end

  def show
    @user = User.find(params[:id])
  end

end