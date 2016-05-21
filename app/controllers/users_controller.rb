class UsersController < ApplicationController
#listing all users
  
  def index
    @users = User.all # getting all the users!
  end

  def show
    @user = User.find(params[:id])
  end

end