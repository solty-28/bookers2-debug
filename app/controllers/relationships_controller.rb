class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:follow_id])
  	following = current_user.follow(@user)
  	if following.save
  	  redirect_back(fallback_location: root_path)
  	else
  	  redirect_back(fallback_location: root_path)
  	end
  end

  def destroy
    @user = User.find(params[:follow_id])
  	following = current_user.unfollow(@user)
  	if following.destroy
  	  redirect_back(fallback_location: root_path)
  	else
  	  redirect_back(fallback_location: root_path)
  	end
  end

  def followings
    @users = current_user.followings.all
  end

  def followers
    @users = current_user.followers.all
  end

end
