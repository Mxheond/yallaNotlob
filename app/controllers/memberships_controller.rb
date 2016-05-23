class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :js

  def index
    @memberships = Membership.all
    respond_with(@memberships)
  end

  def show
    respond_with(@membership)
  end

  def new
    @membership = Membership.new
    @groups = Group.all
    @users = User.all
    respond_with(@membership, @groups, @user)
  end

  def edit
  end

  def create
    @membership = Membership.new(membership_params)
    @membership.save
    respond_with(@membership)
  end

  def update
    @membership.update(membership_params)
    respond_with(@membership)
  end

  def destroy
    @membership.destroy
    respond_with(@membership)
  end

  private
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:group_id, :user_id)
    end
end
