class Api::V1::FriendshipsController < ApplicationController
  def index
    @friendships=Friendship.all
    render json: @friendships
  end

  def show
    @friendship = get_friendship
  end

  def create
    get_user.follow(get_other_user)
    # byebug

  end

  def destroy
    get_user.unfollow(get_other_user)
  end




  private
  def get_user
     User.find(params[:friendship][:follower_id])
  end
  def get_other_user
     User.find(params[:friendship][:followed_id])
  end

  def get_friendship
    @friendship=Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendship).permit(:follower_id, :followed_id)
  end


end
