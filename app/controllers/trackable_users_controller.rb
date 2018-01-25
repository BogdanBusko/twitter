class TrackableUsersController < ApplicationController
  def index
    @track_users = User.find(current_user.id).trackable_user.search(params[:search]).group(:id)
  end

  def create
    if TrackableUser.get_user(params[:user]).count == 0
      begin
        SaveTwitterData.save_user(params[:user], current_user.id)
      rescue Twitter::Error::NotFound => exception
        flash[:notice] = 'User not found!!!'
      end
    else
      user = User.find(current_user.id)
      trackable_user = TrackableUser.get_user(params[:user]).first
      user.trackable_user << trackable_user
    end

    redirect_to trackable_users_url    
  end

  def destroy
    user = User.find(current_user.id)
    trackable_user = user.trackable_user.find(params[:id])

    if trackable_user
      user.trackable_user.delete(trackable_user)
    end
  end
end
