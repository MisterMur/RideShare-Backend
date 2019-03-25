class Api::V1::ForumsController < ApplicationController

  def index
    @forums=Forum.all
    render json: @forums
  end

  def show
    @forum = get_forum
  end

  def create
    @forum = Forum.create(forum_params)
    render json: @forum
  end

  def update
    @forum = get_forum.update(forum_params)
    render json:@forum

  end

  private
  def get_forum
    @forum=Forum.find(params[:id])
  end

  def forum_params
    params.require(:forums).permit(:name)
  end


end
