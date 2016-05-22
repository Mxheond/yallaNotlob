class GroupsController < ApplicationController
  before_action :set_group, only: [ :show, :edit, :update, :destroy]
  respond_to :html
  respond_to :js
  # GET /groups
  # GET /groups.json
   def index
    @groups = Group.where('owner_id' => current_user.id)
    respond_with(@groups)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
    respond_with(@group)
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.save
    respond_with(@group)
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group.update(group_params)
    respond_with(@group)
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_with(@group)
    # @group.destroy
    # respond_to do |format|
    #   format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  def join
    @group = Group.find(params[:id])
    @m = @group.memberships.build(:user_id => current_user.id)
    respond_to do |format|
      if @m.save
        format.html { redirect_to(@group, :notice => 'You have joined this group.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(@group, :notice => 'Join error.') }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :owner_id)
    end
end
