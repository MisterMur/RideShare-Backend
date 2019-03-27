class Api::V1::UsersController < ApplicationController

  def index
    @users=User.all
    render json: @users, :include => [:companies,:rides,:messages,:forums]
  end

  def show
    @user = get_user
    render json: @user
  end

  def create
    @user = User.create(user_params)
    render json: @user
  end

  def update
    byebug
    @user = get_user
    @user.update(user_params)
    render json: @user
  end

  private
  def get_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:experience,:location,:rating,:companies)
  end




end
