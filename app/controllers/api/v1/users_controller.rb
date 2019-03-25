class Api::V1::UsersController < ApplicationController

  def index
    @users=User.all
    render json: @users, :include => [:companies]
  end

  def show
    @user = get_user
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def update
    @user = get_user.update(user_params)
    render json:@user

  end

  private
  def get_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:users).permit(:name)
  end




end
