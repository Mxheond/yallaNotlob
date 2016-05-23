class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @friends = Friend.all
    respond_with(@friends)
  end

  def show
    respond_with(@friend)
  end

  def new
    @friend = Friend.new
    respond_with(@friend)
  end

  def edit
  end

  def create
    @user=User.where(["email = ?", params[:friend]]).first
    if @user !=  current_user && !Friend.exists?(:user_id=>current_user.id ,:friend_id =>@user.id ) 
      @friend = Friend.create({user_id: current_user.id, friend_id: @user.id})
      respond_to do |format|
        if @friend.save
          format.html { redirect_to :controller => 'friends' , :action => 'index' , :data => @user.id }
        end
    end
    else
      respond_to do |format|
      format.html { redirect_to :controller => 'friends' , :action => 'index' , :data => @user.id }
      end
    end
  end

  def update
    @friend.update(friend_params)
    respond_with(@friend)
  end

  def destroy
    @friend.destroy
    respond_with(@friend)
  end

  private
    def set_friend
      @friend = Friend.find(params[:id])
    end

    def friend_params
      params.require(:friend).permit(:user_id)
    end
end
