class Api::V1::FriendshipsController < ApplicationController
  def index
    @friendships=Friendship.all
    # @active_relationships = curr_user.active_relationships
    # @passive_relationships = curr_user.passive_relationships

    # @followee_follows = get_user.follow_follows
    # @follower_follows = get_user.follower_follows
    render json: @friendships
  end

  def show
    @friendship = get_friendship
  end

  def create
    # byebug
    @followed_user = User.find(params[:friendship][:followee_id])
    @friendship =  .active_relationships.new(followee_id: @followed_user.id)

    render json: @friendship
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.follower_user == curr_user
      @friendship.destroy
    end
  end




  private
  def get_user

     User.find(params[:friendship][:follower_id])
  end
  def get_friendship
    @friendship=Friendship.find(params[:id])
  end

  def friendship_params
    byebug
    params.require(:friendships).permit(:follower_id, :followee_id)
  end


end
