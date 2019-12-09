class Api::V1::MessagesController < ApplicationController

  def index
    @messages=Message.all
    render json: @messages, :include => [:user, :forum]
  end

  def show
    @message = get_message
    render json: @message, :include => [:user, :forum]
  end

  def create
    @message = Message.create(message_params)
    render json: @message
  end

  def update
    @message = get_message.update(message_params)
    render json: @message

  end

  private
  def get_message
    @message=Message.find(params[:id])
  end

  def check_forum_exist
    f= Forum.find(params[:forum_id])
    if f!=nil
      
    end
  end

  def message_params
    params.require(:message).permit(:user_id, :forum_id, :content, :user, :forum)
  end


end
