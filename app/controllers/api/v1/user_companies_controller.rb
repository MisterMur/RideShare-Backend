class Api::V1::UserCompaniesController < ApplicationController

  def index
    @user_companies =UserCompany.all
    render json: @user_companies
  end

  def show
    @user_companies = get_user_companies
  end

  def create
    @user_companies = UserCompany.create(user_companies_params)
    render json: @user_companies
  end

  def update
    @user_companies = get_user_companies.update(user_companies_params)
    render json:@user_companies

  end

  private
  def get_user_companies
    @user_companies=UserCompany.find(params[:id])
  end

  def user_companies_params
    params.require(:user_companies).permit(:name)
  end


end
