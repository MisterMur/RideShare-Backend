class Api::V1::MessagesController < ApplicationController

  def index
    @messages=Message.all
    render json: @messages
  end

  def show
    @message = get_message
  end

  def create
    @message = Message.create(message_params)
    render json: @message
  end

  def update
    @message = get_message.update(message_params)
    render json:@message

  end

  private
  def get_message
    @message=Message.find(params[:id])
  end

  def message_params
    params.require(:messages).permit(:name)
  end


end
