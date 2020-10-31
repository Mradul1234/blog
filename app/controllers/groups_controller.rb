class GroupsController < ApplicationController

    def new
      @group = Group.new
    end
    
    def create
      @group = Group.new(group_params)
      if @group.save
        flash[:success] = "Group was successfully created"
        redirect_to @group
      else
        render 'new'
      end
    end

    def index
      @groups = Group.all
    end
  
    def show
      @group = Group.find(params[:id])
    end
  end 

  private

  def group_params
    params.require(:group).permit(:name)
  end