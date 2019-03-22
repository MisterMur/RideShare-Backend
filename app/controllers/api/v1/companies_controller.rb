class Api::V1::CompaniesController < ApplicationController
  def index
    @companies=Company.all
    render json: @companies
  end
  def show
    @company = get_company
  end
  def create
    @company = Company.create(company_params)
    render json: @company
  end
  def update
    @company = get_company.update(company_params)
    render json:@company

  end
 
  private
  def get_company
    @company=Company.find(params[:id])
  end
  def company_params
    params.require(:companies).permit(:name)
  end


end
