class Api::V1::RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: {result: @restaurant, success: true  }, status: 201
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  def login
    @restaurant = Restaurant.find_by(email: restaurant_params[:email])
    if @restaurant
      render json: {result: @restaurant, success: true }, status: 200
    else
      render json: { result: 'Restaurant User not found!'}, status: 422
    end
  end

  # GET /restaurants
  def index
   name = params[:name]
   city = params[:city]

  @restaurants = Restaurant.all
  @restaurants = @restaurants.where('name ILIKE ?', "%#{name}%") if name.present?
  @restaurants = @restaurants.where('city ILIKE ?', "%#{city}%") if city.present?

  render json: { result: @restaurants, success: true }, status: 200
  end

  def search_restaurant

  end

  # GET /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Restaurant not found" }, status: :not_found
  end

  private

  # Only allow a trusted parameter "white list" through
  def restaurant_params
    params.require(:restaurant).permit(:name, :email, :city, :address, :contact, :password)
  end
end
