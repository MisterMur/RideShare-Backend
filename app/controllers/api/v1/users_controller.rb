class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

  def index
    @users=User.all
    render json: @users, :include => [:companies,:rides,:messages,:forums,:followers,:following]#,:followers]
    # render json: @users, :include => [:companies,:rides,:messages,:forums]#,:followers]

  end

  def show
    @user = get_user
    # render :json => @post.as_json(methods: :image_url)
    render json: @user, :include => [:companies,:rides,:messages,:followers,:following,:forums]
  end
  
  def create
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
    projectDir = Rails.root.join('app','res').to_s

    user.profile_pic.attach(io: File.open(projectDir+"/defaultProfilePic.jpg"), filename: "defaultProfilePic.jpg", content_type: "image/jpg")



		if user.save
			jwt = encode_token({user_id: user.id})
			render json: {user: UserSerializer.new(user), jwt: jwt}
		else
			render json: {errors: user.errors.full_messages}
		end
  end

  def image_upload
    user = get_user
    user.profile_pic.attach(params[:image])
    render json: {user: UserSerializer.new(user)}
  end

  def update
    user = get_user
    user.update(user_params)

    companies = []
    company_params.each do|c|
      company = Company.find(c[:id])
      companies << company
    end
    user.companies = companies

    if @user.save
      jwt = encode_token({user_id: user.id})
      render json: {user: UserSerializer.new(user), jwt: jwt}
    else
      render json: {errors: user.errors.full_messages}
    end

  end

private

  def get_user
    @user=User.find(params[:id])
  end

  def get_image
    params.permit(:image)
  end

  def user_params
    params.require(:user).permit(:username,:password,:name,:experience,:location,:rating,:companies,:car,:image)
  end

  def company_params
    params[:companies].map do|company|
      company.permit(:id, :name, :created_at, :updated_at)
    end
  end

end
