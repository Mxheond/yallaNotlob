class UsersController < ApplicationController
#listing all users
  
  def index
    # @users = User.all # getting all the users!
    # @users = User.paginate(:page => params[:page])
    if user_signed_in? 
      @id = current_user.id
     
      @user = User.find(current_user.id)
      @friends = Friendship.where("user_id = ?", current_user.id)
      @user_friends = []
      @friends.each do |friend| 
        @id = friend.friend_id
        puts @id
        @user_friends << User.find_by(id: @id)
      end
      @orders = Order.last(3)
      # # @orders = Order.all() 
      # @orders.user_id = @id 
    else
      redirect_to new_user_session_url
    end
      # @users = User.all
 
  end

  def show
    @user = User.find(params[:id])
  end

end