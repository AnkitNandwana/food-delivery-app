class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {result: @user, success: true  }, status: 201
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: user_params[:email])
    if @user
      render json: {result: @user, success: true }, status: 200
    else
      render json: { result: 'User User not found!'}, status: 422
    end
  end

  # GET /users
  def index
   name = params[:name]
   city = params[:city]

  @users = User.all
  @users = @users.where('name ILIKE ?', "%#{name}%") if name.present?
  @users = @users.where('city ILIKE ?', "%#{city}%") if city.present?

  render json: { result: @users, success: true }, status: 200
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end

  private

  # Only allow a trusted parameter "white list" through
  def user_params
    params.require(:user).permit(:name, :email, :city, :address, :contact, :password)
  end
end
