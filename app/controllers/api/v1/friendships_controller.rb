class Api::V1::FriendshipsController < ApplicationController
  def index
    # @friendships=Friendship.all
    @active_relationships = @follower.active_relationships
    @passive_relationships = @follower.passive_relationships
    # render json: @friendships
  end

  def show
    @friendship = get_friendship
  end

  def create
    # byebug
    @followed_user = User.find(params[:friendship][:followee_id])
    @friendship = @follower.active_relationships.new(followee_id: @followed_user.id)

    render json: @friendship
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.follower_user == @follower
      @friendship.destroy
    end
  end




  private
  def get_friendship
    @friendship=Friendship.find(params[:id])
  end

  def friendship_params
    byebug
    params.require(:friendships).permit(:follower_id, :followee_id)
  end


end
