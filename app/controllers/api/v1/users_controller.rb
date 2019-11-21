class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def index
    @users=User.all
    render json: @users, :include => [:companies,:rides,:messages,:forums]#,:followers]
  end

  def show
    @user = get_user
    render json: @user, :include => [:companies,:rides,:messages,:forums,:followers]
  end

  def create
    # @user = User.create(user_params)
    # render json: @user
    # byebug

    # user = User.new(user_params)
    user = User.new(
      name: params[:name],
      username: params[:username],
      password: params[:password],
      rating: "0.0",
      experience: 0,
      location: "",
      car: "",
      companies: []

    )

		if user.save
			# JWT.encode(payload, 'secret')
			jwt = encode_token({user_id: user.id})
      render json: user, jwt: jwt,:include =>[:companies,:rides,:messages,:forums,:followers]
			# render json: {user: UserSerializer.new(user), jwt: jwt}
		else
			render json: {errors: user.errors.full_messages}
		end
  end

  def update
    @user = get_user
    @user.update(user_params)

    # companies = []
    # company_params.each do|company|
    #   companies << company
    # end

    # puts companies
    companies = []
    company_params.each do|c|
      company = Company.find(c[:id])
      companies << company
    end
    # byebug
    @user.companies = companies
    # byebug

    render json: @user, :include => [:companies,:rides,:messages,:forums,:followers]
  end

  private
  def get_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username,:password,:name,:experience,:location,:rating,:companies,:car)
  end

  def company_params
    params[:companies].map do|company|
      company.permit(:id, :name, :created_at, :updated_at)
    end
  end


end
