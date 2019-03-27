class Api::V1::FriendshipsController < ApplicationController
  def index
    @friendships=Friendship.all
    render json: @friendships
  end

  def show
    @friendship = get_friendship
  end

  def create
    @friendship = Friendship.create(friendship_params)
    render json: @friendship
  end

  def update
    @friendship = get_friendship.update(friendship_params)
    render json:@friendship
  end

  private
  def get_friendship
    @friendship=Friendship.find(params[:id])
  end

  def friendship_params
    params.require(:friendships).permit(:follower_id, :followee_id)
  end


end
