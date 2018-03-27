class GroupsController < ApplicationController


  def create
    @group = Group.new(name:      params[:group][:name],
                       description:  params[:group][:description])

    if @group.save
      flash[:success] = 'Group Created!'
      @group.users.push(User.find_by(id: current_user.id))
      redirect_to '/groups'
    else
      flash.now[:notice] = 'Could not create group. Please verify it has a name and description.'
      render 'new'
    end
  end

  def destroy
    group = Group.find(params[:id])
    unless group.nil?
      group.destroy
      flash[:success] = 'Group Deleted'
      redirect_to '/groups'
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to '/login'
    end
  end

  def add
    group = Group.find(params[:id])
    # user = User.find(params[:user_id])
    # group.users.push(user)
  end
end
