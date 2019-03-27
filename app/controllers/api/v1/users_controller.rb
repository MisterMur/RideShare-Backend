class Api::V1::UsersController < ApplicationController

  def index
    @users=User.all
    render json: @users, :include => [:companies,:rides,:messages,:forums, :followers]
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
    @user = get_user
    @user.update(user_params)

    # companies = []
    # company_params.each do|company|
    #   companies << company
    # end

    # puts companies
    # byebug
    companies = []
    company_params.each do|c|
      company = Company.find(c[:id])
      companies << company
    end
    # byebug
    @user.companies = companies


    render json: @user
  end

  private
  def get_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:experience,:location,:rating,:companies,:car)
  end

  def company_params
    params[:companies].map do|company|
      company.permit(:id, :name, :created_at, :updated_at)
    end
  end


end
